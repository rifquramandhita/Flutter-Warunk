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
  slug: json['slug'] as String,
  merchantId: json['merchant_id'] as String,
  productCategoryId: json['product_category_id'] as String,
  category: json['category'] as String,
  branch: json['branch'] as String?,
  description: json['description'] as String?,
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
  rating: (json['rating'] as num).toDouble(),
  reviewsCount: (json['reviews_count'] as num).toInt(),
);

Map<String, dynamic> _$CustomerProductEntityToJson(
  CustomerProductEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'slug': instance.slug,
  'merchant_id': instance.merchantId,
  'product_category_id': instance.productCategoryId,
  'category': instance.category,
  'branch': ?instance.branch,
  'description': ?instance.description,
  'stock': instance.stock,
  'order_count': instance.orderCount,
  'min_purchase': instance.minPurchase,
  'price': instance.price,
  'is_published': instance.isPublished,
  'has_variant': instance.hasVariant,
  'is_same_dimension': instance.isSameDimension,
  'sku': ?instance.sku,
  'weight': ?instance.weight,
  'length': ?instance.length,
  'width': ?instance.width,
  'height': ?instance.height,
  'merchant': ?instance.merchant,
  'product_category': ?instance.productCategory,
  'variants': ?instance.variants,
  'images': ?instance.images,
  'rating': instance.rating,
  'reviews_count': instance.reviewsCount,
};

CustomerProductCategoryEntity _$CustomerProductCategoryEntityFromJson(
  Map<String, dynamic> json,
) => CustomerProductCategoryEntity(
  id: json['id'] as String,
  name: json['name'] as String,
  slug: json['slug'] as String,
);

Map<String, dynamic> _$CustomerProductCategoryEntityToJson(
  CustomerProductCategoryEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'slug': instance.slug,
};

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
};

CustomerProductImageEntity _$CustomerProductImageEntityFromJson(
  Map<String, dynamic> json,
) => CustomerProductImageEntity(
  id: json['id'] as String,
  filePath: json['file_path'] as String,
  url: json['url'] as String,
  fileName: json['file_name'] as String,
  fileSize: (json['file_size'] as num).toInt(),
  mimeType: json['mime_type'] as String,
  altText: json['alt_text'] as String,
  sortOrder: (json['sort_order'] as num).toInt(),
);

Map<String, dynamic> _$CustomerProductImageEntityToJson(
  CustomerProductImageEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'file_path': instance.filePath,
  'url': instance.url,
  'file_name': instance.fileName,
  'file_size': instance.fileSize,
  'mime_type': instance.mimeType,
  'alt_text': instance.altText,
  'sort_order': instance.sortOrder,
};
