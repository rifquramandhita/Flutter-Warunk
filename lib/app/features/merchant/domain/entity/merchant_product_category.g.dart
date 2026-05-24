// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_product_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantProductCategoryEntity _$MerchantProductCategoryEntityFromJson(
  Map<String, dynamic> json,
) => MerchantProductCategoryEntity(
  id: json['id'] as String,
  name: json['name'] as String,
  slug: json['slug'] as String,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$MerchantProductCategoryEntityToJson(
  MerchantProductCategoryEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'slug': instance.slug,
  'created_at': ?instance.createdAt?.toIso8601String(),
  'updated_at': ?instance.updatedAt?.toIso8601String(),
};
