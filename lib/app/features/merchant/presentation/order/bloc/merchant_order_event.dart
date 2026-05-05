part of 'merchant_order_bloc.dart';

sealed class MerchantOrderEvent {}

class MerchantOrderTabChanged extends MerchantOrderEvent {
  final int index; // 0=Baru, 1=Diproses, 2=Selesai, 3=Dibatalkan
  MerchantOrderTabChanged(this.index);
}

class MerchantOrderFilterTapped extends MerchantOrderEvent {}
