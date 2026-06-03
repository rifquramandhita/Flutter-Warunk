// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_product_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
