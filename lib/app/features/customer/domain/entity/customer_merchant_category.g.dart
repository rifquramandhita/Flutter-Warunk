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
  backgroundCardUrl: json['background_card_url'] as String?,
  iconUrl: json['icon_url'] as String?,
);

Map<String, dynamic> _$CustomerMerchantCategoryEntityToJson(
  CustomerMerchantCategoryEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'slug': instance.slug,
  'background_card_url': ?instance.backgroundCardUrl,
  'icon_url': ?instance.iconUrl,
};
