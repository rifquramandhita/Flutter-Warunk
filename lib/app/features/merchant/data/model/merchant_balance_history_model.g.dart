// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_balance_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MerchantBalanceHistoryResponseModel
_$MerchantBalanceHistoryResponseModelFromJson(Map<String, dynamic> json) =>
    _MerchantBalanceHistoryResponseModel(
      currentBalance: (json['current_balance'] as num?)?.toInt(),
      minimumBalanceForOrders: (json['minimum_balance_for_orders'] as num?)
          ?.toInt(),
      isActive: json['is_active'] as bool?,
      histories:
          (json['histories'] as List<dynamic>?)
              ?.map(
                (e) => MerchantBalanceHistoryModel.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$MerchantBalanceHistoryResponseModelToJson(
  _MerchantBalanceHistoryResponseModel instance,
) => <String, dynamic>{
  'current_balance': ?instance.currentBalance,
  'minimum_balance_for_orders': ?instance.minimumBalanceForOrders,
  'is_active': ?instance.isActive,
  'histories': instance.histories,
};

_MerchantBalanceHistoryModel _$MerchantBalanceHistoryModelFromJson(
  Map<String, dynamic> json,
) => _MerchantBalanceHistoryModel(
  id: json['id'] as String,
  status: json['status'] as String?,
  statusLabel: json['status_label'] as String?,
  paymentStatus: json['payment_status'] as String?,
  paymentStatusLabel: json['payment_status_label'] as String?,
  amount: (json['amount'] as num?)?.toInt(),
  reason: json['reason'] as String?,
  reasonLabel: json['reason_label'] as String?,
  reference: json['reference'] as String?,
  provider: json['provider'] as String?,
  providerOrderId: json['provider_order_id'] as String?,
  providerTransactionId: json['provider_transaction_id'] as String?,
  paymentType: json['payment_type'] as String?,
  paymentUrl: json['payment_url'] as String?,
  isPayable: json['is_payable'] as bool?,
  paidAt: json['paid_at'] as String?,
  expiredAt: json['expired_at'] as String?,
  failedAt: json['failed_at'] as String?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$MerchantBalanceHistoryModelToJson(
  _MerchantBalanceHistoryModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'status': ?instance.status,
  'status_label': ?instance.statusLabel,
  'payment_status': ?instance.paymentStatus,
  'payment_status_label': ?instance.paymentStatusLabel,
  'amount': ?instance.amount,
  'reason': ?instance.reason,
  'reason_label': ?instance.reasonLabel,
  'reference': ?instance.reference,
  'provider': ?instance.provider,
  'provider_order_id': ?instance.providerOrderId,
  'provider_transaction_id': ?instance.providerTransactionId,
  'payment_type': ?instance.paymentType,
  'payment_url': ?instance.paymentUrl,
  'is_payable': ?instance.isPayable,
  'paid_at': ?instance.paidAt,
  'expired_at': ?instance.expiredAt,
  'failed_at': ?instance.failedAt,
  'created_at': ?instance.createdAt,
  'updated_at': ?instance.updatedAt,
};
