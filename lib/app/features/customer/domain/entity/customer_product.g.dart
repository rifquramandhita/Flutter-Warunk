// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerProductEntity _$CustomerProductEntityFromJson(
  Map<String, dynamic> json,
) => CustomerProductEntity(
  id: json['id'] as String,
  name: json['name'] as String,
  slug: json['slug'] as String?,
  merchantId: json['merchant_id'] as String?,
  category: json['category'] as String,
  branch: json['branch'] as String?,
  description: json['description'] as String?,
  stock: (json['stock'] as num?)?.toInt(),
  minPurchase: (json['min_purchase'] as num?)?.toInt(),
  price: (json['price'] as num).toInt(),
  isPublished: json['is_published'] as bool?,
  hasVariant: json['has_variant'] as bool?,
  isSameDimension: json['is_same_dimension'] as bool?,
  sku: json['sku'] as String?,
  weight: (json['weight'] as num?)?.toInt(),
  length: (json['length'] as num?)?.toInt(),
  width: (json['width'] as num?)?.toInt(),
  height: (json['height'] as num?)?.toInt(),
  merchant: json['merchant'] == null
      ? null
      : CustomerMerchantEntity.fromJson(
          json['merchant'] as Map<String, dynamic>,
        ),
  productCategory: json['product_category'] == null
      ? null
      : CustomerProductCategoryEntity.fromJson(
          json['product_category'] as Map<String, dynamic>,
        ),
  variants: (json['variants'] as List<dynamic>?)
      ?.map(
        (e) => CustomerProductVariantEntity.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  images: (json['images'] as List<dynamic>?)
      ?.map(
        (e) => CustomerProductImageEntity.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  rating: (json['rating'] as num?)?.toDouble(),
  reviewsCount: (json['reviews_count'] as num?)?.toInt(),
  reviews: json['reviews'] as List<dynamic>?,
  isWishlisted: json['is_wishlisted'] as bool?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  chatUrl: json['chat_url'] as String?,
);

Map<String, dynamic> _$CustomerProductEntityToJson(
  CustomerProductEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'slug': ?instance.slug,
  'merchant_id': ?instance.merchantId,
  'category': instance.category,
  'branch': ?instance.branch,
  'description': ?instance.description,
  'stock': ?instance.stock,
  'min_purchase': ?instance.minPurchase,
  'price': instance.price,
  'is_published': ?instance.isPublished,
  'has_variant': ?instance.hasVariant,
  'is_same_dimension': ?instance.isSameDimension,
  'sku': ?instance.sku,
  'weight': ?instance.weight,
  'length': ?instance.length,
  'width': ?instance.width,
  'height': ?instance.height,
  'merchant': ?instance.merchant,
  'product_category': ?instance.productCategory,
  'variants': ?instance.variants,
  'images': ?instance.images,
  'rating': ?instance.rating,
  'reviews_count': ?instance.reviewsCount,
  'reviews': ?instance.reviews,
  'is_wishlisted': ?instance.isWishlisted,
  'created_at': ?instance.createdAt,
  'updated_at': ?instance.updatedAt,
  'chat_url': ?instance.chatUrl,
};
