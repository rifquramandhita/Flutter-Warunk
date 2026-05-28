part of 'merchant_order_bloc.dart';

sealed class MerchantOrderEvent {}

class MerchantOrderEventFetchStarted extends MerchantOrderEvent {}

class MerchantOrderEventTabChanged extends MerchantOrderEvent {
  final String status;
  MerchantOrderEventTabChanged(this.status);
}

class MerchantOrderEventFilterTapped extends MerchantOrderEvent {}
