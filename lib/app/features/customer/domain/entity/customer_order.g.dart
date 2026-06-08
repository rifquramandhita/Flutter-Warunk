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
  $type: json['runtimeType'] as String?,
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
  'runtimeType': instance.$type,
};

CustomerOrderGetPromotionParam _$CustomerOrderGetPromotionParamFromJson(
  Map<String, dynamic> json,
) => CustomerOrderGetPromotionParam(
  cartIds: (json['cart_ids'] as List<dynamic>).map((e) => e as String).toList(),
  addressId: json['address_id'] as String?,
  shippingKey: json['shipping_key'] as String?,
  biteshipRateKey: json['biteship_rate_key'] as String?,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$CustomerOrderGetPromotionParamToJson(
  CustomerOrderGetPromotionParam instance,
) => <String, dynamic>{
  'cart_ids': instance.cartIds,
  'address_id': ?instance.addressId,
  'shipping_key': ?instance.shippingKey,
  'biteship_rate_key': ?instance.biteshipRateKey,
  'runtimeType': instance.$type,
};
