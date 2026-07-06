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

CustomerOrderCompleteParam _$CustomerOrderCompleteParamFromJson(
  Map<String, dynamic> json,
) => CustomerOrderCompleteParam(
  orderId: json['orderId'] as String,
  reviews: (json['reviews'] as List<dynamic>)
      .map(
        (e) => CustomerOrderCompleteReviewParam.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList(),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$CustomerOrderCompleteParamToJson(
  CustomerOrderCompleteParam instance,
) => <String, dynamic>{
  'orderId': instance.orderId,
  'reviews': instance.reviews,
  'runtimeType': instance.$type,
};

CustomerOrderCompleteReviewParam _$CustomerOrderCompleteReviewParamFromJson(
  Map<String, dynamic> json,
) => CustomerOrderCompleteReviewParam(
  orderItemId: json['orderItemId'] as String,
  rating: (json['rating'] as num).toInt(),
  review: json['review'] as String?,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$CustomerOrderCompleteReviewParamToJson(
  CustomerOrderCompleteReviewParam instance,
) => <String, dynamic>{
  'orderItemId': instance.orderItemId,
  'rating': instance.rating,
  'review': instance.review,
  'runtimeType': instance.$type,
};

CustomerOrderCancelParam _$CustomerOrderCancelParamFromJson(
  Map<String, dynamic> json,
) => CustomerOrderCancelParam(
  orderId: json['order_id'] as String,
  reason: json['reason'] as String,
  customerBank: json['customer_bank'] as String?,
  customerAccountNumber: json['customer_account_number'] as String?,
  customerAccountName: json['customer_account_name'] as String?,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$CustomerOrderCancelParamToJson(
  CustomerOrderCancelParam instance,
) => <String, dynamic>{
  'order_id': instance.orderId,
  'reason': instance.reason,
  'customer_bank': ?instance.customerBank,
  'customer_account_number': ?instance.customerAccountNumber,
  'customer_account_name': ?instance.customerAccountName,
  'runtimeType': instance.$type,
};

CustomerOrderEntity _$CustomerOrderEntityFromJson(
  Map<String, dynamic> json,
) => CustomerOrderEntity(
  id: json['id'] as String?,
  invoiceNumber: json['invoice_number'] as String?,
  invoiceUrl: json['invoice_url'] as String?,
  merchantId: json['merchant_id'] as String?,
  customerId: (json['customer_id'] as num?)?.toInt(),
  customerAddressId: json['customer_address_id'] as String?,
  merchantAccountId: json['merchant_account_id'] as String?,
  subtotal: (json['subtotal'] as num?)?.toInt(),
  shippingCost: (json['shipping_cost'] as num?)?.toInt(),
  serviceFee: (json['service_fee'] as num?)?.toInt(),
  promotionId: json['promotion_id'] as String?,
  promotionCode: json['promotion_code'] as String?,
  promotionTitle: json['promotion_title'] as String?,
  promotionType: json['promotion_type'] as String?,
  promotionDiscount: (json['promotion_discount'] as num?)?.toInt(),
  promotion: json['promotion'],
  promotions: json['promotions'] as List<dynamic>?,
  total: (json['total'] as num?)?.toInt(),
  paidAmount: (json['paid_amount'] as num?)?.toInt(),
  paymentProof: json['payment_proof'] as String?,
  type: json['type'] as String?,
  status: $enumDecodeNullable(_$OrderStatusEnumMap, json['status']),
  statusLabel: json['status_label'] as String?,
  notes: json['notes'] as String?,
  cancelReason: json['cancel_reason'] as String?,
  customerBank: json['customer_bank'] as String?,
  customerAccountNumber: json['customer_account_number'] as String?,
  customerAccountName: json['customer_account_name'] as String?,
  refundProof: json['refund_proof'] as String?,
  customer: json['customer'],
  customerAddress: json['customer_address'],
  merchantAccount: json['merchant_account'],
  merchant: json['merchant'],
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => CustomerOrderItemEntity.fromJson(e as Map<String, dynamic>))
      .toList(),
  reviews: json['reviews'] as List<dynamic>?,
  needsReview: json['needs_review'] as bool?,
  shipping: json['shipping'] == null
      ? null
      : CustomerShippingEntity.fromJson(
          json['shipping'] as Map<String, dynamic>,
        ),
  paidAt: json['paid_at'] as String?,
  cancelledAt: json['cancelled_at'] as String?,
  completedAt: json['completed_at'] as String?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  chatUrl: json['chat_url'] as String?,
  nextActions: (json['next_actions'] as List<dynamic>?)
      ?.map(
        (e) =>
            CustomerOrderNextActionEntity.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$CustomerOrderEntityToJson(
  CustomerOrderEntity instance,
) => <String, dynamic>{
  'id': ?instance.id,
  'invoice_number': ?instance.invoiceNumber,
  'invoice_url': ?instance.invoiceUrl,
  'merchant_id': ?instance.merchantId,
  'customer_id': ?instance.customerId,
  'customer_address_id': ?instance.customerAddressId,
  'merchant_account_id': ?instance.merchantAccountId,
  'subtotal': ?instance.subtotal,
  'shipping_cost': ?instance.shippingCost,
  'service_fee': ?instance.serviceFee,
  'promotion_id': ?instance.promotionId,
  'promotion_code': ?instance.promotionCode,
  'promotion_title': ?instance.promotionTitle,
  'promotion_type': ?instance.promotionType,
  'promotion_discount': ?instance.promotionDiscount,
  'promotion': ?instance.promotion,
  'promotions': ?instance.promotions,
  'total': ?instance.total,
  'paid_amount': ?instance.paidAmount,
  'payment_proof': ?instance.paymentProof,
  'type': ?instance.type,
  'status': ?_$OrderStatusEnumMap[instance.status],
  'status_label': ?instance.statusLabel,
  'notes': ?instance.notes,
  'cancel_reason': ?instance.cancelReason,
  'customer_bank': ?instance.customerBank,
  'customer_account_number': ?instance.customerAccountNumber,
  'customer_account_name': ?instance.customerAccountName,
  'refund_proof': ?instance.refundProof,
  'customer': ?instance.customer,
  'customer_address': ?instance.customerAddress,
  'merchant_account': ?instance.merchantAccount,
  'merchant': ?instance.merchant,
  'items': ?instance.items,
  'reviews': ?instance.reviews,
  'needs_review': ?instance.needsReview,
  'shipping': ?instance.shipping,
  'paid_at': ?instance.paidAt,
  'cancelled_at': ?instance.cancelledAt,
  'completed_at': ?instance.completedAt,
  'created_at': ?instance.createdAt,
  'updated_at': ?instance.updatedAt,
  'chat_url': ?instance.chatUrl,
  'next_actions': ?instance.nextActions,
  'runtimeType': instance.$type,
};

const _$OrderStatusEnumMap = {
  OrderStatus.waitingMerchantConfirmation: 'waiting_merchant_confirmation',
  OrderStatus.waitingPayment: 'waiting_payment',
  OrderStatus.waitingPaymentConfirmation: 'waiting_payment_confirmation',
  OrderStatus.waitingCancel: 'waiting_cancel',
  OrderStatus.processing: 'processing',
  OrderStatus.shipped: 'shipped',
  OrderStatus.received: 'received',
  OrderStatus.completed: 'completed',
  OrderStatus.cancelled: 'cancelled',
  OrderStatus.rejected: 'rejected',
};
