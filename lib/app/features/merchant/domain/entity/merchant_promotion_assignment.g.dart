// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_promotion_assignment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantPromotionAssignmentEntity _$MerchantPromotionAssignmentEntityFromJson(
  Map<String, dynamic> json,
) => MerchantPromotionAssignmentEntity(
  id: json['id'] as String,
  merchantId: json['merchant_id'] as String,
  merchantName: json['merchant_name'] as String,
  datetimeStart: DateTime.parse(json['datetime_start'] as String),
  datetimeEnd: DateTime.parse(json['datetime_end'] as String),
);

Map<String, dynamic> _$MerchantPromotionAssignmentEntityToJson(
  MerchantPromotionAssignmentEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'merchant_id': instance.merchantId,
  'merchant_name': instance.merchantName,
  'datetime_start': instance.datetimeStart.toIso8601String(),
  'datetime_end': instance.datetimeEnd.toIso8601String(),
};
