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
);

Map<String, dynamic> _$MerchantCategoryEntityToJson(
  MerchantCategoryEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'slug': instance.slug,
};
