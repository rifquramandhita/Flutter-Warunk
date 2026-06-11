// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantOrderEntity _$MerchantOrderEntityFromJson(Map<String, dynamic> json) =>
    MerchantOrderEntity(
      id: json['id'] as String,
      invoiceNumber: json['invoice_number'] as String?,
      invoiceUrl: json['invoice_url'] as String?,
      merchantId: json['merchant_id'] as String?,
      customerId: (json['customer_id'] as num?)?.toInt(),
      customerAddressId: json['customer_address_id'] as String?,
      merchantAccountId: json['merchant_account_id'] as String?,
      subtotal: json['subtotal'] as num?,
      shippingCost: json['shipping_cost'] as num?,
      serviceFee: json['service_fee'] as num?,
      total: json['total'] as num?,
      paidAmount: json['paid_amount'] as num?,
      paymentProof: json['payment_proof'] as String?,
      type: json['type'] as String?,
      status: $enumDecodeNullable(_$OrderStatusEnumMap, json['status']),
      statusLabel: json['status_label'] as String?,
      notes: json['notes'] as String?,
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
  'total': ?instance.total,
  'paid_amount': ?instance.paidAmount,
  'payment_proof': ?instance.paymentProof,
  'type': ?instance.type,
  'status': ?_$OrderStatusEnumMap[instance.status],
  'status_label': ?instance.statusLabel,
  'notes': ?instance.notes,
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
