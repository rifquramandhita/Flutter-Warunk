// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationEntity _$NotificationEntityFromJson(Map<String, dynamic> json) =>
    NotificationEntity(
      modelType: $enumDecodeNullable(
        _$NotificationModelTypeEnumMap,
        json['model_type'],
      ),
      modelId: json['model_id'] as String?,
    );

Map<String, dynamic> _$NotificationEntityToJson(NotificationEntity instance) =>
    <String, dynamic>{
      'model_type': ?_$NotificationModelTypeEnumMap[instance.modelType],
      'model_id': ?instance.modelId,
    };

const _$NotificationModelTypeEnumMap = {
  NotificationModelType.order: 'order',
  NotificationModelType.product: 'product',
  NotificationModelType.merchant: 'merchant',
  NotificationModelType.promotion: 'promotion',
  NotificationModelType.merchantBalanceHistory: 'merchant_balance_history',
  NotificationModelType.unknown: 'unknown',
};
