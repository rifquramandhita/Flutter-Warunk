import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_order.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_order_reject_cancel_use_case.dart';
import 'package:warunk/core/network/data_state.dart';

part 'merchant_reject_cancel_order_event.dart';
part 'merchant_reject_cancel_order_state.dart';

class MerchantRejectCancelOrderBloc
    extends Bloc<MerchantRejectCancelOrderEvent, MerchantRejectCancelOrderState> {
  final MerchantOrderRejectCancelUseCase _rejectCancelUseCase;
  final String orderId;

  MerchantRejectCancelOrderBloc({
    required MerchantOrderRejectCancelUseCase rejectCancelUseCase,
    required this.orderId,
  })  : _rejectCancelUseCase = rejectCancelUseCase,
        super(const MerchantRejectCancelOrderState()) {
    on<MerchantRejectCancelOrderEventReasonChanged>(_onReasonChanged);
    on<MerchantRejectCancelOrderEventSubmit>(_onSubmit);
  }

  void _onReasonChanged(
    MerchantRejectCancelOrderEventReasonChanged event,
    Emitter<MerchantRejectCancelOrderState> emit,
  ) {
    emit(state.copyWith(reason: event.reason, errorMessage: null));
  }

  Future<void> _onSubmit(
    MerchantRejectCancelOrderEventSubmit event,
    Emitter<MerchantRejectCancelOrderState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final param = MerchantOrderRejectCancelParam(
      id: orderId,
      reason: state.reason,
    );
    
    final response = await _rejectCancelUseCase.call(params: param);
    if (response is SuccessState) {
      emit(state.copyWith(isSuccess: true, isLoading: false));
    } else {
      emit(state.copyWith(errorMessage: response.message, isLoading: false));
    }
  }
}
