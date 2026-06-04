import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_order.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_order_reject_param.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_order_accept_use_case.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_order_reject_use_case.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_order_received_use_case.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_order_get_by_id_use_case.dart';
import 'package:warunk/core/network/data_state.dart';
import 'package:url_launcher/url_launcher.dart';

part 'merchant_detail_order_event.dart';
part 'merchant_detail_order_state.dart';

class MerchantDetailOrderBloc
    extends Bloc<MerchantDetailOrderEvent, MerchantDetailOrderState> {
  final MerchantOrderGetByIdUseCase _getByIdUseCase;
  final MerchantOrderAcceptUseCase _acceptUseCase;
  final MerchantOrderRejectUseCase _rejectUseCase;
  final MerchantOrderReceivedUseCase _receivedUseCase;

  MerchantDetailOrderBloc({
    required MerchantOrderGetByIdUseCase getByIdUseCase,
    required MerchantOrderAcceptUseCase acceptUseCase,
    required MerchantOrderRejectUseCase rejectUseCase,
    required MerchantOrderReceivedUseCase receivedUseCase,
  })  : _getByIdUseCase = getByIdUseCase,
        _acceptUseCase = acceptUseCase,
        _rejectUseCase = rejectUseCase,
        _receivedUseCase = receivedUseCase,
        super(const MerchantDetailOrderState()) {
    on<MerchantDetailOrderEventFetchStarted>(_onFetchStarted);
    on<MerchantDetailOrderEventMapsTapped>(_onMapsTapped);
    on<MerchantDetailOrderEventAccept>(_onAccept);
    on<MerchantDetailOrderEventReject>(_onReject);
    on<MerchantDetailOrderEventReceived>(_onReceived);
    on<MerchantDetailOrderEventPaymentProofTapped>(_onPaymentProofTapped);
  }

  Future<void> _onFetchStarted(
    MerchantDetailOrderEventFetchStarted event,
    Emitter<MerchantDetailOrderState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final response = await _getByIdUseCase.call(params: event.orderId);

    if (response is SuccessState) {
      emit(state.copyWith(
        isSuccess: true,
        order: response.data,
      ));
    } else {
      emit(state.copyWith(errorMessage: response.message));
    }

    emit(state.copyWith(isLoading: false));
  }

  Future<void> _onMapsTapped(
    MerchantDetailOrderEventMapsTapped event,
    Emitter<MerchantDetailOrderState> emit,
  ) async {
    final lat = state.order?.customerAddress?.latitude;
    final lng = state.order?.customerAddress?.longitude;
    final address = state.order?.customerAddress?.address;

    if (lat != null && lng != null && lat.isNotEmpty && lng.isNotEmpty) {
      final url = Uri.parse('https://www.google.com/maps/search/?api=1&query=$lat,$lng');
      try {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } catch (e) {
        // Handle error silently or emit error state if needed
      }
    } else if (address != null && address.isNotEmpty) {
      final encodedAddress = Uri.encodeComponent(address);
      final url = Uri.parse('https://www.google.com/maps/search/?api=1&query=$encodedAddress');
      try {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } catch (e) {
        // Handle error silently
      }
    }
  }

  Future<void> _onPaymentProofTapped(
    MerchantDetailOrderEventPaymentProofTapped event,
    Emitter<MerchantDetailOrderState> emit,
  ) async {
    final paymentProofUrl = state.order?.paymentProof;
    if (paymentProofUrl != null && paymentProofUrl.isNotEmpty) {
      final url = Uri.parse(paymentProofUrl);
      try {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } catch (e) {
        // Handle error silently
      }
    }
  }

  Future<void> _onAccept(
    MerchantDetailOrderEventAccept event,
    Emitter<MerchantDetailOrderState> emit,
  ) async {
    if (state.order?.id == null) return;
    emit(state.copyWith(isLoading: true));
    final response = await _acceptUseCase.call(params: state.order!.id!);
    if (response is SuccessState) {
      add(MerchantDetailOrderEventFetchStarted(state.order!.id!));
    } else {
      emit(state.copyWith(errorMessage: response.message, isLoading: false));
    }
  }

  Future<void> _onReject(
    MerchantDetailOrderEventReject event,
    Emitter<MerchantDetailOrderState> emit,
  ) async {
    if (state.order?.id == null) return;
    emit(state.copyWith(isLoading: true));
    final param = MerchantOrderRejectSendParam(reason: event.reason);
    final response = await _rejectUseCase.call(
      id: state.order!.id!,
      param: param,
    );
    if (response is SuccessState) {
      add(MerchantDetailOrderEventFetchStarted(state.order!.id!));
    } else {
      emit(state.copyWith(errorMessage: response.message, isLoading: false));
    }
  }

  Future<void> _onReceived(
    MerchantDetailOrderEventReceived event,
    Emitter<MerchantDetailOrderState> emit,
  ) async {
    if (state.order?.id == null) return;
    emit(state.copyWith(isLoading: true));
    final response = await _receivedUseCase.call(id: state.order!.id!);
    if (response is SuccessState) {
      add(MerchantDetailOrderEventFetchStarted(state.order!.id!));
    } else {
      emit(state.copyWith(errorMessage: response.message, isLoading: false));
    }
  }
}
