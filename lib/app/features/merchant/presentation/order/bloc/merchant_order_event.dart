part of 'merchant_order_bloc.dart';

sealed class MerchantOrderEvent {}

class MerchantOrderEventFetchStarted extends MerchantOrderEvent {}

class MerchantOrderEventTabChanged extends MerchantOrderEvent {
  final int index; // 0=Baru, 1=Diproses, 2=Selesai, 3=Dibatalkan
  MerchantOrderEventTabChanged(this.index);
}

class MerchantOrderEventFilterTapped extends MerchantOrderEvent {}
