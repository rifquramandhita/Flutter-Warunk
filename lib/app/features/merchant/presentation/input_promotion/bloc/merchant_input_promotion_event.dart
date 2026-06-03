part of 'merchant_input_promotion_bloc.dart';

sealed class MerchantInputPromotionEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class MerchantInputPromotionTipeChangedEvent extends MerchantInputPromotionEvent {
  final String value;
  MerchantInputPromotionTipeChangedEvent(this.value);

  @override
  List<Object?> get props => [value];
}

class MerchantInputPromotionTipeDiskonChangedEvent extends MerchantInputPromotionEvent {
  final String value;
  MerchantInputPromotionTipeDiskonChangedEvent(this.value);

  @override
  List<Object?> get props => [value];
}

class MerchantInputPromotionNamaChangedEvent extends MerchantInputPromotionEvent {
  final String value;
  MerchantInputPromotionNamaChangedEvent(this.value);

  @override
  List<Object?> get props => [value];
}

class MerchantInputPromotionNilaiChangedEvent extends MerchantInputPromotionEvent {
  final String value;
  MerchantInputPromotionNilaiChangedEvent(this.value);

  @override
  List<Object?> get props => [value];
}

class MerchantInputPromotionMinBeliChangedEvent extends MerchantInputPromotionEvent {
  final String value;
  MerchantInputPromotionMinBeliChangedEvent(this.value);

  @override
  List<Object?> get props => [value];
}

class MerchantInputPromotionMulaiChangedEvent extends MerchantInputPromotionEvent {
  final DateTime date;
  MerchantInputPromotionMulaiChangedEvent(this.date);

  @override
  List<Object?> get props => [date];
}

class MerchantInputPromotionSelesaiChangedEvent extends MerchantInputPromotionEvent {
  final DateTime date;
  MerchantInputPromotionSelesaiChangedEvent(this.date);

  @override
  List<Object?> get props => [date];
}

class MerchantInputPromotionKuotaChangedEvent extends MerchantInputPromotionEvent {
  final String value;
  MerchantInputPromotionKuotaChangedEvent(this.value);

  @override
  List<Object?> get props => [value];
}

class MerchantInputPromotionKodeChangedEvent extends MerchantInputPromotionEvent {
  final String value;
  MerchantInputPromotionKodeChangedEvent(this.value);

  @override
  List<Object?> get props => [value];
}

class MerchantInputPromotionTargetPenggunaChangedEvent extends MerchantInputPromotionEvent {
  final String value;
  MerchantInputPromotionTargetPenggunaChangedEvent(this.value);

  @override
  List<Object?> get props => [value];
}

class MerchantInputPromotionIsShowToggledEvent extends MerchantInputPromotionEvent {}

class MerchantInputPromotionIsUnlimitedUseToggledEvent extends MerchantInputPromotionEvent {}

class MerchantInputPromotionFetchProductsEvent extends MerchantInputPromotionEvent {}

class MerchantInputPromotionFetchDetailEvent extends MerchantInputPromotionEvent {
  final String id;
  MerchantInputPromotionFetchDetailEvent(this.id);

  @override
  List<Object?> get props => [id];
}

class MerchantInputPromotionAddProductRowEvent extends MerchantInputPromotionEvent {}

class MerchantInputPromotionRemoveProductRowEvent extends MerchantInputPromotionEvent {
  final int index;
  MerchantInputPromotionRemoveProductRowEvent(this.index);

  @override
  List<Object?> get props => [index];
}

class MerchantInputPromotionProductSelectedEvent extends MerchantInputPromotionEvent {
  final int index;
  final String productId;
  MerchantInputPromotionProductSelectedEvent(this.index, this.productId);

  @override
  List<Object?> get props => [index, productId];
}

class MerchantInputPromotionProductAllVariantsToggledEvent extends MerchantInputPromotionEvent {
  final int index;
  MerchantInputPromotionProductAllVariantsToggledEvent(this.index);

  @override
  List<Object?> get props => [index];
}

class MerchantInputPromotionProductVariantToggledEvent extends MerchantInputPromotionEvent {
  final int index;
  final String variantId;
  MerchantInputPromotionProductVariantToggledEvent(this.index, this.variantId);

  @override
  List<Object?> get props => [index, variantId];
}

class MerchantInputPromotionSavedEvent extends MerchantInputPromotionEvent {}
