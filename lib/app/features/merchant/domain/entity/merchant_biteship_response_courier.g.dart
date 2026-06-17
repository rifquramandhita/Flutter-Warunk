// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_biteship_response_courier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantBiteshipResponseCourierEntity
_$MerchantBiteshipResponseCourierEntityFromJson(Map<String, dynamic> json) =>
    MerchantBiteshipResponseCourierEntity(
      link: json['link'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      phone: json['phone'] as String?,
      company: json['company'] as String?,
      waybillId: json['waybill_id'] as String?,
      trackingId: json['tracking_id'] as String?,
      routingCode: json['routing_code'] as String?,
    );

Map<String, dynamic> _$MerchantBiteshipResponseCourierEntityToJson(
  MerchantBiteshipResponseCourierEntity instance,
) => <String, dynamic>{
  'link': ?instance.link,
  'name': ?instance.name,
  'type': ?instance.type,
  'phone': ?instance.phone,
  'company': ?instance.company,
  'waybill_id': ?instance.waybillId,
  'tracking_id': ?instance.trackingId,
  'routing_code': ?instance.routingCode,
};
