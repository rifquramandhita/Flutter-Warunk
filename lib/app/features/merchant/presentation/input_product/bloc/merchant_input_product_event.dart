part of 'merchant_input_product_bloc.dart';

sealed class MerchantInputProductEvent {}

class MerchantInputProductGet extends MerchantInputProductEvent {
  final String? id;
  MerchantInputProductGet(this.id);
}

class MerchantInputProductDownloadImages extends MerchantInputProductEvent {
  final List<String> urls;
  MerchantInputProductDownloadImages(this.urls);
}

class MerchantInputProductNameChanged extends MerchantInputProductEvent {
  final String value;
  MerchantInputProductNameChanged(this.value);
}

class MerchantInputProductCategoryChanged extends MerchantInputProductEvent {
  final String value;
  MerchantInputProductCategoryChanged(this.value);
}

class MerchantInputProductPriceChanged extends MerchantInputProductEvent {
  final String value;
  MerchantInputProductPriceChanged(this.value);
}

class MerchantInputProductStockChanged extends MerchantInputProductEvent {
  final String value;
  MerchantInputProductStockChanged(this.value);
}

class MerchantInputProductMinPurchaseChanged extends MerchantInputProductEvent {
  final String value;
  MerchantInputProductMinPurchaseChanged(this.value);
}

class MerchantInputProductDescriptionChanged extends MerchantInputProductEvent {
  final String value;
  MerchantInputProductDescriptionChanged(this.value);
}

class MerchantInputProductWeightChanged extends MerchantInputProductEvent {
  final String value;
  MerchantInputProductWeightChanged(this.value);
}

class MerchantInputProductLengthChanged extends MerchantInputProductEvent {
  final String value;
  MerchantInputProductLengthChanged(this.value);
}

class MerchantInputProductWidthChanged extends MerchantInputProductEvent {
  final String value;
  MerchantInputProductWidthChanged(this.value);
}

class MerchantInputProductHeightChanged extends MerchantInputProductEvent {
  final String value;
  MerchantInputProductHeightChanged(this.value);
}

class MerchantInputProductIsPublishedToggled
    extends MerchantInputProductEvent {}

class MerchantInputProductPhotoTapped extends MerchantInputProductEvent {}

class MerchantInputProductPhotoRemoved extends MerchantInputProductEvent {
  final int index;
  MerchantInputProductPhotoRemoved(this.index);
}

class MerchantInputProductSaved extends MerchantInputProductEvent {}
