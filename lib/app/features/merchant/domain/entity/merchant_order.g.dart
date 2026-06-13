// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantOrderRejectParam _$MerchantOrderRejectParamFromJson(
  Map<String, dynamic> json,
) => MerchantOrderRejectParam(
  reason: json['reason'] as String,
  customerBank: json['customer_bank'] as String,
  customerAccountNumber: json['customer_account_number'] as String,
  customerAccountName: json['customer_account_name'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$MerchantOrderRejectParamToJson(
  MerchantOrderRejectParam instance,
) => <String, dynamic>{
  'reason': instance.reason,
  'customer_bank': instance.customerBank,
  'customer_account_number': instance.customerAccountNumber,
  'customer_account_name': instance.customerAccountName,
  'runtimeType': instance.$type,
};

MerchantOrderEntity _$MerchantOrderEntityFromJson(Map<String, dynamic> json) =>
    MerchantOrderEntity(
      id: json['id'] as String,
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
      customer: json['customer'] == null
          ? null
          : MerchantOrderCustomerEntity.fromJson(
              json['customer'] as Map<String, dynamic>,
            ),
      customerAddress: json['customer_address'] == null
          ? null
          : MerchantOrderCustomerAddressEntity.fromJson(
              json['customer_address'] as Map<String, dynamic>,
            ),
      merchantAccount: json['merchant_account'] == null
          ? null
          : MerchantAccountEntity.fromJson(
              json['merchant_account'] as Map<String, dynamic>,
            ),
      items:
          (json['items'] as List<dynamic>?)
              ?.map(
                (e) =>
                    MerchantOrderItemEntity.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      shipping: json['shipping'] == null
          ? null
          : MerchantOrderShippingEntity.fromJson(
              json['shipping'] as Map<String, dynamic>,
            ),
      paidAt: json['paid_at'] as String?,
      cancelledAt: json['cancelled_at'] as String?,
      completedAt: json['completed_at'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$MerchantOrderEntityToJson(
  MerchantOrderEntity instance,
) => <String, dynamic>{
  'id': instance.id,
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
  'items': instance.items,
  'shipping': ?instance.shipping,
  'paid_at': ?instance.paidAt,
  'cancelled_at': ?instance.cancelledAt,
  'completed_at': ?instance.completedAt,
  'created_at': ?instance.createdAt,
  'updated_at': ?instance.updatedAt,
  'runtimeType': instance.$type,
};

const _$OrderStatusEnumMap = {
  OrderStatus.waitingPayment: 'waiting_payment',
  OrderStatus.waitingPaymentConfirmation: 'waiting_payment_confirmation',
  OrderStatus.waitingCancel: 'waiting_cancel',
  OrderStatus.processing: 'processing',
  OrderStatus.shipped: 'shipped',
  OrderStatus.received: 'received',
  OrderStatus.completed: 'completed',
  OrderStatus.cancelled: 'cancelled',
};
