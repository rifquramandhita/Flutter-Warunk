// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_checkout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerCheckoutOptionEntity _$CustomerCheckoutOptionEntityFromJson(
  Map<String, dynamic> json,
) => CustomerCheckoutOptionEntity(
  merchant: json['merchant'] == null
      ? null
      : CustomerMerchantEntity.fromJson(
          json['merchant'] as Map<String, dynamic>,
        ),
  blockingMessage: json['blocking_message'] as String?,
  shippingOptions: (json['shipping_options'] as List<dynamic>?)
      ?.map(
        (e) => CustomerCheckoutShippingOptionEntity.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList(),
  biteshipShippingOptions: (json['biteship_shipping_options'] as List<dynamic>?)
      ?.map(
        (e) => CustomerCheckoutShippingOptionEntity.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList(),
  selectedShippingKey: json['selected_shipping_key'] as String?,
  selectedBiteshipRateKey: json['selected_biteship_rate_key'] as String?,
  selectedShippingOption: json['selected_shipping_option'] == null
      ? null
      : CustomerCheckoutShippingOptionEntity.fromJson(
          json['selected_shipping_option'] as Map<String, dynamic>,
        ),
  selectedMerchantAccountId: json['selected_merchant_account_id'] as String?,
  paymentMethods: (json['payment_methods'] as List<dynamic>?)
      ?.map(
        (e) => CustomerCheckoutPaymentMethodEntity.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList(),
  summary: json['summary'] == null
      ? null
      : CustomerCheckoutSummaryEntity.fromJson(
          json['summary'] as Map<String, dynamic>,
        ),
  availablePromotions: (json['available_promotions'] as List<dynamic>?)
      ?.map((e) => CustomerPromotionEntity.fromJson(e as Map<String, dynamic>))
      .toList(),
  promotion: json['promotion'] == null
      ? null
      : CustomerPromotionEntity.fromJson(
          json['promotion'] as Map<String, dynamic>,
        ),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$CustomerCheckoutOptionEntityToJson(
  CustomerCheckoutOptionEntity instance,
) => <String, dynamic>{
  'merchant': ?instance.merchant,
  'blocking_message': ?instance.blockingMessage,
  'shipping_options': ?instance.shippingOptions,
  'biteship_shipping_options': ?instance.biteshipShippingOptions,
  'selected_shipping_key': ?instance.selectedShippingKey,
  'selected_biteship_rate_key': ?instance.selectedBiteshipRateKey,
  'selected_shipping_option': ?instance.selectedShippingOption,
  'selected_merchant_account_id': ?instance.selectedMerchantAccountId,
  'payment_methods': ?instance.paymentMethods,
  'summary': ?instance.summary,
  'available_promotions': ?instance.availablePromotions,
  'promotion': ?instance.promotion,
  'runtimeType': instance.$type,
};

CustomerCheckoutSendParam _$CustomerCheckoutSendParamFromJson(
  Map<String, dynamic> json,
) => CustomerCheckoutSendParam(
  cartIds: (json['cart_ids'] as List<dynamic>).map((e) => e as String).toList(),
  notes: json['notes'] as String?,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$CustomerCheckoutSendParamToJson(
  CustomerCheckoutSendParam instance,
) => <String, dynamic>{
  'cart_ids': instance.cartIds,
  'notes': ?instance.notes,
  'runtimeType': instance.$type,
};

CustomerCheckoutGetShippingOptionParam
_$CustomerCheckoutGetShippingOptionParamFromJson(Map<String, dynamic> json) =>
    CustomerCheckoutGetShippingOptionParam(
      cartIds: (json['cart_ids'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      addressId: json['address_id'] as String?,
      shippingKey: json['shipping_key'] as String?,
      promotions: (json['promotions'] as List<dynamic>?)
          ?.map((e) => Map<String, String>.from(e as Map))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$CustomerCheckoutGetShippingOptionParamToJson(
  CustomerCheckoutGetShippingOptionParam instance,
) => <String, dynamic>{
  'cart_ids': instance.cartIds,
  'address_id': ?instance.addressId,
  'shipping_key': ?instance.shippingKey,
  'promotions': ?instance.promotions,
  'runtimeType': instance.$type,
};

CustomerCheckoutShippingOptionEntity
_$CustomerCheckoutShippingOptionEntityFromJson(Map<String, dynamic> json) =>
    CustomerCheckoutShippingOptionEntity(
      key: json['key'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      price: (json['price'] as num?)?.toInt(),
      eta: json['eta'] as String?,
    );

Map<String, dynamic> _$CustomerCheckoutShippingOptionEntityToJson(
  CustomerCheckoutShippingOptionEntity instance,
) => <String, dynamic>{
  'key': ?instance.key,
  'title': ?instance.title,
  'description': ?instance.description,
  'price': ?instance.price,
  'eta': ?instance.eta,
};

CustomerCheckoutPaymentMethodEntity
_$CustomerCheckoutPaymentMethodEntityFromJson(Map<String, dynamic> json) =>
    CustomerCheckoutPaymentMethodEntity(
      key: json['key'] as String?,
      label: json['label'] as String?,
      description: json['description'] as String?,
      bankName: json['bank_name'] as String?,
      accountName: json['account_name'] as String?,
      accountNumber: json['account_number'] as String?,
    );

Map<String, dynamic> _$CustomerCheckoutPaymentMethodEntityToJson(
  CustomerCheckoutPaymentMethodEntity instance,
) => <String, dynamic>{
  'key': ?instance.key,
  'label': ?instance.label,
  'description': ?instance.description,
  'bank_name': ?instance.bankName,
  'account_name': ?instance.accountName,
  'account_number': ?instance.accountNumber,
};

CustomerCheckoutSummaryEntity _$CustomerCheckoutSummaryEntityFromJson(
  Map<String, dynamic> json,
) => CustomerCheckoutSummaryEntity(
  totalProduct: (json['total_product'] as num?)?.toInt(),
  subtotal: (json['subtotal'] as num?)?.toInt(),
  discount: (json['discount'] as num?)?.toInt(),
  shippingCost: (json['shipping_cost'] as num?)?.toInt(),
  serviceFee: (json['service_fee'] as num?)?.toInt(),
  total: (json['total'] as num?)?.toInt(),
);

Map<String, dynamic> _$CustomerCheckoutSummaryEntityToJson(
  CustomerCheckoutSummaryEntity instance,
) => <String, dynamic>{
  'total_product': ?instance.totalProduct,
  'subtotal': ?instance.subtotal,
  'discount': ?instance.discount,
  'shipping_cost': ?instance.shippingCost,
  'service_fee': ?instance.serviceFee,
  'total': ?instance.total,
};
