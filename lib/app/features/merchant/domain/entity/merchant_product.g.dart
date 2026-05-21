// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantProductEntity _$MerchantProductEntityFromJson(
  Map<String, dynamic> json,
) => MerchantProductEntity(
  id: json['id'] as String,
  name: json['name'] as String,
  slug: json['slug'] as String,
  merchantId: json['merchant_id'] as String,
  productCategoryId: json['product_category_id'] as String,
  category: json['category'] as String,
  branch: json['branch'] as String,
  description: json['description'] as String,
  stock: (json['stock'] as num).toInt(),
  orderCount: (json['order_count'] as num).toInt(),
  minPurchase: (json['min_purchase'] as num).toInt(),
  price: (json['price'] as num).toInt(),
  isPublished: json['is_published'] as bool,
  hasVariant: json['has_variant'] as bool,
  isSameDimension: json['is_same_dimension'] as bool,
  sku: json['sku'] as String?,
  weight: (json['weight'] as num?)?.toInt(),
  length: (json['length'] as num?)?.toInt(),
  width: (json['width'] as num?)?.toInt(),
  height: (json['height'] as num?)?.toInt(),
  merchant: MerchantMerchantEntity.fromJson(
    json['merchant'] as Map<String, dynamic>,
  ),
  productCategory: MerchantProductCategoryEntity.fromJson(
    json['product_category'] as Map<String, dynamic>,
  ),
  variants:
      (json['variants'] as List<dynamic>?)
          ?.map(
            (e) => MerchantProductVariantEntity.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      const [],
  images:
      (json['images'] as List<dynamic>?)
          ?.map(
            (e) =>
                MerchantProductImageEntity.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$MerchantProductEntityToJson(
  MerchantProductEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'slug': instance.slug,
  'merchant_id': instance.merchantId,
  'product_category_id': instance.productCategoryId,
  'category': instance.category,
  'branch': instance.branch,
  'description': instance.description,
  'stock': instance.stock,
  'order_count': instance.orderCount,
  'min_purchase': instance.minPurchase,
  'price': instance.price,
  'is_published': instance.isPublished,
  'has_variant': instance.hasVariant,
  'is_same_dimension': instance.isSameDimension,
  'sku': instance.sku,
  'weight': instance.weight,
  'length': instance.length,
  'width': instance.width,
  'height': instance.height,
  'merchant': instance.merchant,
  'product_category': instance.productCategory,
  'variants': instance.variants,
  'images': instance.images,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};
