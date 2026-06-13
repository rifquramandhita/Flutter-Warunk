// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_wishlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerWishlistAddParam _$CustomerWishlistAddParamFromJson(
  Map<String, dynamic> json,
) => CustomerWishlistAddParam(
  productId: json['product_id'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$CustomerWishlistAddParamToJson(
  CustomerWishlistAddParam instance,
) => <String, dynamic>{
  'product_id': instance.productId,
  'runtimeType': instance.$type,
};

CustomerWishlistEntity _$CustomerWishlistEntityFromJson(
  Map<String, dynamic> json,
) => CustomerWishlistEntity(
  id: json['id'] as String,
  userId: (json['user_id'] as num?)?.toInt(),
  productId: json['product_id'] as String?,
  product: json['product'] == null
      ? null
      : CustomerProductEntity.fromJson(json['product'] as Map<String, dynamic>),
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$CustomerWishlistEntityToJson(
  CustomerWishlistEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'user_id': ?instance.userId,
  'product_id': ?instance.productId,
  'product': ?instance.product,
  'created_at': ?instance.createdAt,
  'updated_at': ?instance.updatedAt,
  'runtimeType': instance.$type,
};
