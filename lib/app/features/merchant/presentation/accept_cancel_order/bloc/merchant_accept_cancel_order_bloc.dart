import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_order.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_order_accept_cancel_use_case.dart';
import 'package:warunk/core/network/data_state.dart';

part 'merchant_accept_cancel_order_event.dart';
part 'merchant_accept_cancel_order_state.dart';

class MerchantAcceptCancelOrderBloc
    extends Bloc<MerchantAcceptCancelOrderEvent, MerchantAcceptCancelOrderState> {
  final MerchantOrderAcceptCancelUseCase _acceptCancelUseCase;
  final String orderId;

  MerchantAcceptCancelOrderBloc({
    required MerchantOrderAcceptCancelUseCase acceptCancelUseCase,
    required this.orderId,
  })  : _acceptCancelUseCase = acceptCancelUseCase,
        super(const MerchantAcceptCancelOrderState()) {
    on<MerchantAcceptCancelOrderEventRefundProofPicked>(_onRefundProofPicked);
    on<MerchantAcceptCancelOrderEventSubmit>(_onSubmit);
  }

  void _onRefundProofPicked(
    MerchantAcceptCancelOrderEventRefundProofPicked event,
    Emitter<MerchantAcceptCancelOrderState> emit,
  ) {
    emit(state.copyWith(refundProof: event.file));
  }

  Future<void> _onSubmit(
    MerchantAcceptCancelOrderEventSubmit event,
    Emitter<MerchantAcceptCancelOrderState> emit,
  ) async {
    if (state.refundProof == null) return;
    
    emit(state.copyWith(isLoading: true));
    final param = MerchantOrderAcceptCancelParam(
      id: orderId,
      refundProof: state.refundProof,
    );
    
    final response = await _acceptCancelUseCase.call(params: param);
    if (response is SuccessState) {
      emit(state.copyWith(isSuccess: true, isLoading: false));
    } else {
      emit(state.copyWith(errorMessage: response.message, isLoading: false));
    }
  }
}
