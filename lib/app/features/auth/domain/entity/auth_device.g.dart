// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthDeviceEntity _$AuthDeviceEntityFromJson(Map<String, dynamic> json) =>
    AuthDeviceEntity(
      brand: json['brand'] as String,
      model: json['model'] as String,
      os: json['os'] as String,
    );

Map<String, dynamic> _$AuthDeviceEntityToJson(AuthDeviceEntity instance) =>
    <String, dynamic>{
      'brand': instance.brand,
      'model': instance.model,
      'os': instance.os,
    };
