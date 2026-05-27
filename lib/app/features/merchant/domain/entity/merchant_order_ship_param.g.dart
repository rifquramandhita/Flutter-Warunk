// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_order_ship_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantOrderShipSendParam _$MerchantOrderShipSendParamFromJson(
  Map<String, dynamic> json,
) => MerchantOrderShipSendParam(
  driverName: json['driver_name'] as String?,
  driverPhone: json['driver_phone'] as String?,
  trackingNumber: json['tracking_number'] as String?,
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$MerchantOrderShipSendParamToJson(
  MerchantOrderShipSendParam instance,
) => <String, dynamic>{
  'driver_name': ?instance.driverName,
  'driver_phone': ?instance.driverPhone,
  'tracking_number': ?instance.trackingNumber,
  'notes': ?instance.notes,
};
