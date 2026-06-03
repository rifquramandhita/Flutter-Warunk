// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_product_variant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerProductVariantEntity _$CustomerProductVariantEntityFromJson(
  Map<String, dynamic> json,
) => CustomerProductVariantEntity(
  id: json['id'] as String,
  productId: json['product_id'] as String,
  variantCombination: Map<String, String>.from(
    json['variant_combination'] as Map,
  ),
  sku: json['sku'] as String?,
  price: (json['price'] as num).toInt(),
  stock: (json['stock'] as num).toInt(),
  minPurchase: (json['min_purchase'] as num).toInt(),
  weight: (json['weight'] as num?)?.toInt(),
  length: (json['length'] as num?)?.toInt(),
  width: (json['width'] as num?)?.toInt(),
  height: (json['height'] as num?)?.toInt(),
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$CustomerProductVariantEntityToJson(
  CustomerProductVariantEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'product_id': instance.productId,
  'variant_combination': instance.variantCombination,
  'sku': ?instance.sku,
  'price': instance.price,
  'stock': instance.stock,
  'min_purchase': instance.minPurchase,
  'weight': ?instance.weight,
  'length': ?instance.length,
  'width': ?instance.width,
  'height': ?instance.height,
  'created_at': ?instance.createdAt,
  'updated_at': ?instance.updatedAt,
};
