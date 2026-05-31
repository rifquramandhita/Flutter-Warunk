// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_merchant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerMerchantEntity _$CustomerMerchantEntityFromJson(
  Map<String, dynamic> json,
) => CustomerMerchantEntity(
  id: json['id'] as String,
  name: json['name'] as String,
  slug: json['slug'] as String,
  photo: json['photo'] as String,
  isActive: json['is_active'] as bool,
  isOpen: json['is_open'] as bool,
);

Map<String, dynamic> _$CustomerMerchantEntityToJson(
  CustomerMerchantEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'slug': instance.slug,
  'photo': instance.photo,
  'is_active': instance.isActive,
  'is_open': instance.isOpen,
};
