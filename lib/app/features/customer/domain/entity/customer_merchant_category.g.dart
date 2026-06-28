// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_merchant_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerMerchantCategoryEntity _$CustomerMerchantCategoryEntityFromJson(
  Map<String, dynamic> json,
) => CustomerMerchantCategoryEntity(
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

Map<String, dynamic> _$CustomerMerchantCategoryEntityToJson(
  CustomerMerchantCategoryEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'slug': instance.slug,
  'created_at': ?instance.createdAt?.toIso8601String(),
  'updated_at': ?instance.updatedAt?.toIso8601String(),
};
