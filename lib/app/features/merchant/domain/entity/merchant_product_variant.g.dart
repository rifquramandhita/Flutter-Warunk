// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_product_variant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantProductVariantEntity _$MerchantProductVariantEntityFromJson(
  Map<String, dynamic> json,
) => MerchantProductVariantEntity(
  id: json['id'] as String,
  productId: json['product_id'] as String,
  variantCombination: json['variant_combination'] as Map<String, dynamic>,
  sku: json['sku'] as String?,
  price: (json['price'] as num).toInt(),
  stock: (json['stock'] as num).toInt(),
  minPurchase: (json['min_purchase'] as num).toInt(),
  weight: (json['weight'] as num?)?.toInt(),
  length: (json['length'] as num?)?.toInt(),
  width: (json['width'] as num?)?.toInt(),
  height: (json['height'] as num?)?.toInt(),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$MerchantProductVariantEntityToJson(
  MerchantProductVariantEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'product_id': instance.productId,
  'variant_combination': instance.variantCombination,
  'sku': instance.sku,
  'price': instance.price,
  'stock': instance.stock,
  'min_purchase': instance.minPurchase,
  'weight': instance.weight,
  'length': instance.length,
  'width': instance.width,
  'height': instance.height,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
  'runtimeType': instance.$type,
};

MerchantProductVariantSendParam _$MerchantProductVariantSendParamFromJson(
  Map<String, dynamic> json,
) => MerchantProductVariantSendParam(
  variantCombination: json['variant_combination'] as Map<String, dynamic>,
  sku: json['sku'] as String?,
  price: (json['price'] as num).toInt(),
  stock: (json['stock'] as num).toInt(),
  minPurchase: (json['min_purchase'] as num).toInt(),
  weight: (json['weight'] as num?)?.toInt(),
  length: (json['length'] as num?)?.toInt(),
  width: (json['width'] as num?)?.toInt(),
  height: (json['height'] as num?)?.toInt(),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$MerchantProductVariantSendParamToJson(
  MerchantProductVariantSendParam instance,
) => <String, dynamic>{
  'variant_combination': instance.variantCombination,
  'sku': instance.sku,
  'price': instance.price,
  'stock': instance.stock,
  'min_purchase': instance.minPurchase,
  'weight': instance.weight,
  'length': instance.length,
  'width': instance.width,
  'height': instance.height,
  'runtimeType': instance.$type,
};
