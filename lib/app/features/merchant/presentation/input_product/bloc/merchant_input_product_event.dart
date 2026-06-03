part of 'merchant_input_product_bloc.dart';

sealed class MerchantInputProductEvent {}

class MerchantInputProductGet extends MerchantInputProductEvent {
  final String? id;
  MerchantInputProductGet(this.id);
}

class MerchantInputProductLoadCategories extends MerchantInputProductEvent {}

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

class MerchantInputProductSameDimensionToggled
    extends MerchantInputProductEvent {}

// ── Variant definition events ─────────────────────────────────────────────────

class MerchantInputProductVariantAdded extends MerchantInputProductEvent {}

class MerchantInputProductVariantRemoved extends MerchantInputProductEvent {
  final int variantIndex;
  MerchantInputProductVariantRemoved(this.variantIndex);
}

class MerchantInputProductVariantNameChanged
    extends MerchantInputProductEvent {
  final int variantIndex;
  final String value;
  MerchantInputProductVariantNameChanged(this.variantIndex, this.value);
}

class MerchantInputProductVariantOptionAdded
    extends MerchantInputProductEvent {
  final int variantIndex;
  MerchantInputProductVariantOptionAdded(this.variantIndex);
}

class MerchantInputProductVariantOptionRemoved
    extends MerchantInputProductEvent {
  final int variantIndex;
  final int optionIndex;
  MerchantInputProductVariantOptionRemoved(this.variantIndex, this.optionIndex);
}

/// Update the option name string at [optionIndex] inside variant [variantIndex]
class MerchantInputProductVariantOptionNameChanged
    extends MerchantInputProductEvent {
  final int variantIndex;
  final int optionIndex;
  final String value;
  MerchantInputProductVariantOptionNameChanged(
    this.variantIndex,
    this.optionIndex,
    this.value,
  );
}

// ── Combination events ────────────────────────────────────────────────────────

/// Update the price/stock/etc. of one generated combination
class MerchantInputProductCombinationChanged
    extends MerchantInputProductEvent {
  final int combinationIndex;
  final MerchantProductVariantSendParam updated;
  MerchantInputProductCombinationChanged(this.combinationIndex, this.updated);
}
