// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_operational_hour_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantOperationalHourItemEntity _$MerchantOperationalHourItemEntityFromJson(
  Map<String, dynamic> json,
) => MerchantOperationalHourItemEntity(
  id: json['id'] as String,
  day: json['day'] as String,
  isClosed: json['is_closed'] as bool,
  isOpen24Hours: json['is_open_24_hours'] as bool,
  timeOpen: json['time_open'] as String?,
  timeClose: json['time_close'] as String?,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$MerchantOperationalHourItemEntityToJson(
  MerchantOperationalHourItemEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'day': instance.day,
  'is_closed': instance.isClosed,
  'is_open_24_hours': instance.isOpen24Hours,
  'time_open': ?instance.timeOpen,
  'time_close': ?instance.timeClose,
  'runtimeType': instance.$type,
};

MerchantOperationalHourItemUpdateParam
_$MerchantOperationalHourItemUpdateParamFromJson(Map<String, dynamic> json) =>
    MerchantOperationalHourItemUpdateParam(
      day: json['day'] as String,
      isClosed: json['is_closed'] as bool,
      isOpen24Hours: json['is_open_24_hours'] as bool,
      timeOpen: json['time_open'] as String?,
      timeClose: json['time_close'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$MerchantOperationalHourItemUpdateParamToJson(
  MerchantOperationalHourItemUpdateParam instance,
) => <String, dynamic>{
  'day': instance.day,
  'is_closed': instance.isClosed,
  'is_open_24_hours': instance.isOpen24Hours,
  'time_open': ?instance.timeOpen,
  'time_close': ?instance.timeClose,
  'runtimeType': instance.$type,
};
