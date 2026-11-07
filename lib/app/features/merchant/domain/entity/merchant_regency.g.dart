// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_regency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantRegencyEntity _$MerchantRegencyEntityFromJson(
  Map<String, dynamic> json,
) => MerchantRegencyEntity(
  id: (json['id'] as num).toInt(),
  provinceId: (json['province_id'] as num).toInt(),
  code: json['code'] as String,
  name: json['name'] as String,
  type: json['type'] as String?,
);

Map<String, dynamic> _$MerchantRegencyEntityToJson(
  MerchantRegencyEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'province_id': instance.provinceId,
  'code': instance.code,
  'name': instance.name,
  'type': ?instance.type,
};
