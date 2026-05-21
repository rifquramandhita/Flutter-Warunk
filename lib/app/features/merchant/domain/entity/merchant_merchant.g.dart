// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_merchant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantMerchantEntity _$MerchantMerchantEntityFromJson(
  Map<String, dynamic> json,
) => MerchantMerchantEntity(
  id: json['id'] as String,
  name: json['name'] as String,
  slug: json['slug'] as String,
  photo: json['photo'] as String?,
  isOpen: json['is_open'] as bool,
);

Map<String, dynamic> _$MerchantMerchantEntityToJson(
  MerchantMerchantEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'slug': instance.slug,
  'photo': instance.photo,
  'is_open': instance.isOpen,
};
