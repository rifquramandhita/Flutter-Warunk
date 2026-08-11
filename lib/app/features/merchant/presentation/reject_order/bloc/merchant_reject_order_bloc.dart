import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_order.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_order_reject_use_case.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_setting_get_customer_service_whatsapp_use_case.dart';
import 'package:warunk/core/network/data_state.dart';

part 'merchant_reject_order_event.dart';
part 'merchant_reject_order_state.dart';

class MerchantRejectOrderBloc
    extends Bloc<MerchantRejectOrderEvent, MerchantRejectOrderState> {
  final MerchantOrderRejectUseCase _rejectUseCase;
  final MerchantSettingGetCustomerServiceWhatsAppUseCase getWhatsAppUseCase;
  final String orderId;

  MerchantRejectOrderBloc({
    required MerchantOrderRejectUseCase rejectUseCase,
    required this.getWhatsAppUseCase,
    required this.orderId,
  }) : _rejectUseCase = rejectUseCase,
       super(const MerchantRejectOrderState()) {
    on<MerchantRejectOrderEventReasonChanged>(_onReasonChanged);
    on<MerchantRejectOrderEventBankChanged>(_onBankChanged);
    on<MerchantRejectOrderEventAccountNumberChanged>(_onAccountNumberChanged);
    on<MerchantRejectOrderEventAccountNameChanged>(_onAccountNameChanged);
    on<MerchantRejectOrderEventRefundProofPicked>(_onRefundProofPicked);
    on<MerchantRejectOrderEventSubmit>(_onSubmit);
    on<MerchantRejectOrderEventGetWhatsAppNumber>(_onGetWhatsAppNumber);
    on<MerchantRejectOrderEventResetWhatsAppNavigation>(_onResetWhatsAppNavigation);
  }

  void _onReasonChanged(
    MerchantRejectOrderEventReasonChanged event,
    Emitter<MerchantRejectOrderState> emit,
  ) {
    emit(state.copyWith(reason: event.reason));
  }

  void _onBankChanged(
    MerchantRejectOrderEventBankChanged event,
    Emitter<MerchantRejectOrderState> emit,
  ) {
    emit(state.copyWith(customerBank: event.bank));
  }

  void _onAccountNumberChanged(
    MerchantRejectOrderEventAccountNumberChanged event,
    Emitter<MerchantRejectOrderState> emit,
  ) {
    emit(state.copyWith(customerAccountNumber: event.accountNumber));
  }

  void _onAccountNameChanged(
    MerchantRejectOrderEventAccountNameChanged event,
    Emitter<MerchantRejectOrderState> emit,
  ) {
    emit(state.copyWith(customerAccountName: event.accountName));
  }

  void _onRefundProofPicked(
    MerchantRejectOrderEventRefundProofPicked event,
    Emitter<MerchantRejectOrderState> emit,
  ) {
    emit(state.copyWith(refundProof: event.file));
  }

  Future<void> _onSubmit(
    MerchantRejectOrderEventSubmit event,
    Emitter<MerchantRejectOrderState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final param = MerchantOrderRejectParam(
      reason: state.reason,
      customerBank: (state.customerBank.isNotEmpty) ? state.customerBank : null,
      customerAccountNumber: (state.customerAccountNumber.isNotEmpty)
          ? state.customerAccountNumber
          : null,
      customerAccountName: (state.customerAccountName.isNotEmpty)
          ? state.customerAccountName
          : null,
      refundProof: state.refundProof,
    );

    final response = await _rejectUseCase.call(id: orderId, param: param);
    if (response is SuccessState) {
      emit(state.copyWith(isSuccess: true, isLoading: false));
    } else {
      emit(state.copyWith(errorMessage: response.message, isLoading: false));
    }
  }

  Future<void> _onGetWhatsAppNumber(
    MerchantRejectOrderEventGetWhatsAppNumber event,
    Emitter<MerchantRejectOrderState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final result = await getWhatsAppUseCase();
    if (result is SuccessState && result.data != null) {
      emit(state.copyWith(
        isLoading: false,
        whatsAppNumber: result.data,
        shouldLaunchWhatsApp: true,
      ));
    } else {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: result.message.isNotEmpty ? result.message : 'Gagal mengambil nomor WhatsApp',
      ));
    }
  }

  void _onResetWhatsAppNavigation(
    MerchantRejectOrderEventResetWhatsAppNavigation event,
    Emitter<MerchantRejectOrderState> emit,
  ) {
    emit(state.copyWith(shouldLaunchWhatsApp: false));
  }
}
