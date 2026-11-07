// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_district.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantDistrictEntity _$MerchantDistrictEntityFromJson(
  Map<String, dynamic> json,
) => MerchantDistrictEntity(
  id: (json['id'] as num).toInt(),
  regencyId: (json['regency_id'] as num).toInt(),
  code: json['code'] as String,
  name: json['name'] as String,
);

Map<String, dynamic> _$MerchantDistrictEntityToJson(
  MerchantDistrictEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'regency_id': instance.regencyId,
  'code': instance.code,
  'name': instance.name,
};
