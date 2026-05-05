part of 'merchant_promo_bloc.dart';

sealed class MerchantPromoEvent {}

class MerchantPromoTabChanged extends MerchantPromoEvent {
  final int index; // 0=Aktif, 1=Akan Datang, 2=Selesai
  MerchantPromoTabChanged(this.index);
}

class MerchantPromoToggled extends MerchantPromoEvent {
  final String promoId;
  MerchantPromoToggled(this.promoId);
}
