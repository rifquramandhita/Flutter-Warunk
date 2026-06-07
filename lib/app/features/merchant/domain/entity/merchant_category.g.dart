// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantCategoryEntity _$MerchantCategoryEntityFromJson(
  Map<String, dynamic> json,
) => MerchantCategoryEntity(
  id: json['id'] as String,
  name: json['name'] as String,
  slug: json['slug'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$MerchantCategoryEntityToJson(
  MerchantCategoryEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'slug': instance.slug,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};
