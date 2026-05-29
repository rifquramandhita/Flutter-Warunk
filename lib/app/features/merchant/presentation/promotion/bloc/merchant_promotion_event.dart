part of 'merchant_promotion_bloc.dart';

sealed class MerchantPromotionEvent {}

class MerchantPromotionEventTabChanged extends MerchantPromotionEvent {
  final int index; // 0=Aktif, 1=Akan Datang, 2=Selesai
  MerchantPromotionEventTabChanged(this.index);
}

class MerchantPromotionEventToggled extends MerchantPromotionEvent {
  final String promoId;
  MerchantPromotionEventToggled(this.promoId);
}

class MerchantPromotionEventFetched extends MerchantPromotionEvent {}

class MerchantPromotionEventDeleted extends MerchantPromotionEvent {
  final String promoId;
  MerchantPromotionEventDeleted(this.promoId);
}
