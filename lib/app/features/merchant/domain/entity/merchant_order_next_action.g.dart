// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_order_next_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantOrderNextActionEntity _$MerchantOrderNextActionEntityFromJson(
  Map<String, dynamic> json,
) => MerchantOrderNextActionEntity(
  key: json['key'] as String?,
  label: json['label'] as String?,
  method: json['method'] as String?,
  url: json['url'] as String?,
);

Map<String, dynamic> _$MerchantOrderNextActionEntityToJson(
  MerchantOrderNextActionEntity instance,
) => <String, dynamic>{
  'key': ?instance.key,
  'label': ?instance.label,
  'method': ?instance.method,
  'url': ?instance.url,
};
