// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_province.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantProvinceEntity _$MerchantProvinceEntityFromJson(
  Map<String, dynamic> json,
) => MerchantProvinceEntity(
  id: (json['id'] as num).toInt(),
  code: json['code'] as String,
  name: json['name'] as String,
);

Map<String, dynamic> _$MerchantProvinceEntityToJson(
  MerchantProvinceEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'code': instance.code,
  'name': instance.name,
};
