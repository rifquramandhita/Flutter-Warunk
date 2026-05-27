part of 'merchant_detail_order_bloc.dart';

sealed class MerchantDetailOrderEvent {}

class MerchantDetailOrderEventFetchStarted extends MerchantDetailOrderEvent {
  final String orderId;
  MerchantDetailOrderEventFetchStarted(this.orderId);
}

class MerchantDetailOrderEventMapsTapped extends MerchantDetailOrderEvent {}

class MerchantDetailOrderEventAccept extends MerchantDetailOrderEvent {}

class MerchantDetailOrderEventReject extends MerchantDetailOrderEvent {
  final String reason;
  MerchantDetailOrderEventReject(this.reason);
}

class MerchantDetailOrderEventReceived extends MerchantDetailOrderEvent {}
