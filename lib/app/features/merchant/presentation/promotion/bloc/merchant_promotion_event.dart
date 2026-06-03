part of 'merchant_promotion_bloc.dart';

sealed class MerchantPromotionEvent {}

class MerchantPromotionEventTabChanged extends MerchantPromotionEvent {
  final int index;
  MerchantPromotionEventTabChanged(this.index);
}

class MerchantPromotionEventGet extends MerchantPromotionEvent {}

class MerchantPromotionEventDeleted extends MerchantPromotionEvent {
  final String promoId;
  MerchantPromotionEventDeleted(this.promoId);
}
