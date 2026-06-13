part of 'merchant_reject_cancel_order_bloc.dart';

sealed class MerchantRejectCancelOrderEvent extends Equatable {
  const MerchantRejectCancelOrderEvent();

  @override
  List<Object> get props => [];
}

class MerchantRejectCancelOrderEventReasonChanged extends MerchantRejectCancelOrderEvent {
  final String reason;
  const MerchantRejectCancelOrderEventReasonChanged(this.reason);

  @override
  List<Object> get props => [reason];
}

class MerchantRejectCancelOrderEventSubmit extends MerchantRejectCancelOrderEvent {}
