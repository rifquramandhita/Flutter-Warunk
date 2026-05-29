part of 'merchant_promo_bloc.dart';

sealed class MerchantPromoEvent {}

class MerchantPromoEventTabChanged extends MerchantPromoEvent {
  final int index; // 0=Aktif, 1=Akan Datang, 2=Selesai
  MerchantPromoEventTabChanged(this.index);
}

class MerchantPromoEventToggled extends MerchantPromoEvent {
  final String promoId;
  MerchantPromoEventToggled(this.promoId);
}

class MerchantPromoEventFetched extends MerchantPromoEvent {}
