// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_operational_hour.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantOperationalHourUpdateParam _$MerchantOperationalHourUpdateParamFromJson(
  Map<String, dynamic> json,
) => MerchantOperationalHourUpdateParam(
  isOpenAllDay: json['is_open_all_day'] as bool,
  isOpen24Hours: json['is_open_24_hours'] as bool,
  timeOpen: json['time_open'] as String?,
  timeClose: json['time_close'] as String?,
  merchantOpens: (json['merchant_opens'] as List<dynamic>?)
      ?.map(
        (e) => MerchantOperationalHourItemUpdateParam.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList(),
);

Map<String, dynamic> _$MerchantOperationalHourUpdateParamToJson(
  MerchantOperationalHourUpdateParam instance,
) => <String, dynamic>{
  'is_open_all_day': instance.isOpenAllDay,
  'is_open_24_hours': instance.isOpen24Hours,
  'time_open': ?instance.timeOpen,
  'time_close': ?instance.timeClose,
  'merchant_opens': ?instance.merchantOpens?.map((e) => e.toJson()).toList(),
};
