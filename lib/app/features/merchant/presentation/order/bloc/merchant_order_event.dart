part of 'merchant_order_bloc.dart';

sealed class MerchantOrderEvent {}

class MerchantOrderEventGet extends MerchantOrderEvent {}

class MerchantOrderEventTabChanged extends MerchantOrderEvent {
  final String status;
  MerchantOrderEventTabChanged(this.status);
}
