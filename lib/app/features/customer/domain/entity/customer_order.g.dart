// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerOrderCreateParam _$CustomerOrderCreateParamFromJson(
  Map<String, dynamic> json,
) => CustomerOrderCreateParam(
  addressId: json['addressId'] as String,
  shippingKey: json['shippingKey'] as String?,
  biteshipRateKey: json['biteshipRateKey'] as String?,
  merchantAccountId: json['merchantAccountId'] as String?,
  notes: json['notes'] as String?,
  paymentProof: json['paymentProof'] as String,
  cartIds: (json['cartIds'] as List<dynamic>).map((e) => e as String).toList(),
  promotionId: json['promotionId'] as String?,
  promotionCode: json['promotionCode'] as String?,
);

Map<String, dynamic> _$CustomerOrderCreateParamToJson(
  CustomerOrderCreateParam instance,
) => <String, dynamic>{
  'addressId': instance.addressId,
  'shippingKey': instance.shippingKey,
  'biteshipRateKey': instance.biteshipRateKey,
  'merchantAccountId': instance.merchantAccountId,
  'notes': instance.notes,
  'paymentProof': instance.paymentProof,
  'cartIds': instance.cartIds,
  'promotionId': instance.promotionId,
  'promotionCode': instance.promotionCode,
};
