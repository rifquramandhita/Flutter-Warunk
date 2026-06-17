// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_shipping.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantShippingUpdateParam _$MerchantShippingUpdateParamFromJson(
  Map<String, dynamic> json,
) => MerchantShippingUpdateParam(
  internalCourier: json['internal_courier'] as bool,
  internalCourierShippingCost: (json['internal_courier_shipping_cost'] as num)
      .toInt(),
  instantCourier: json['instant_courier'] as bool,
  pickupAtStore: json['pickup_at_store'] as bool,
  maxDistanceInternalCourier: (json['max_distance_internal_courier'] as num)
      .toInt(),
  courierCodeAvailable: (json['courier_code_available'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$MerchantShippingUpdateParamToJson(
  MerchantShippingUpdateParam instance,
) => <String, dynamic>{
  'internal_courier': instance.internalCourier,
  'internal_courier_shipping_cost': instance.internalCourierShippingCost,
  'instant_courier': instance.instantCourier,
  'pickup_at_store': instance.pickupAtStore,
  'max_distance_internal_courier': instance.maxDistanceInternalCourier,
  'courier_code_available': instance.courierCodeAvailable,
};
