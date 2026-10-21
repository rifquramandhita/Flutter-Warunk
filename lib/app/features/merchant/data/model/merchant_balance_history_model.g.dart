// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_balance_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MerchantBalanceHistoryResponseModel
_$MerchantBalanceHistoryResponseModelFromJson(
  Map<String, dynamic> json,
) => _MerchantBalanceHistoryResponseModel(
  currentBalance: _intFromDynamic(json['current_balance']),
  minimumBalanceForOrders: _intFromDynamic(json['minimum_balance_for_orders']),
  isActive: json['is_active'] as bool?,
  histories:
      (json['histories'] as List<dynamic>?)
          ?.map(
            (e) =>
                MerchantBalanceHistoryModel.fromJson(e as Map<String, dynamic>),
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

_MerchantDestinationBankAccountModel
_$MerchantDestinationBankAccountModelFromJson(Map<String, dynamic> json) =>
    _MerchantDestinationBankAccountModel(
      bankName: json['bank_name'] as String?,
      accountNumber: json['account_number'] as String?,
      accountName: json['account_name'] as String?,
    );

Map<String, dynamic> _$MerchantDestinationBankAccountModelToJson(
  _MerchantDestinationBankAccountModel instance,
) => <String, dynamic>{
  'bank_name': ?instance.bankName,
  'account_number': ?instance.accountNumber,
  'account_name': ?instance.accountName,
};

_MerchantBalanceHistoryModel _$MerchantBalanceHistoryModelFromJson(
  Map<String, dynamic> json,
) => _MerchantBalanceHistoryModel(
  id: _stringFromDynamic(json['id']),
  status: json['status'] as String?,
  statusLabel: json['status_label'] as String?,
  paymentStatus: json['payment_status'] as String?,
  paymentStatusLabel: json['payment_status_label'] as String?,
  amount: _intFromDynamic(json['amount']),
  reason: json['reason'] as String?,
  reasonLabel: json['reason_label'] as String?,
  reference: json['reference'] as String?,
  provider: json['provider'] as String?,
  providerOrderId: json['provider_order_id'] as String?,
  providerTransactionId: json['provider_transaction_id'] as String?,
  paymentType: json['payment_type'] as String?,
  paymentUrl: json['payment_url'] as String?,
  isPayable: json['is_payable'] as bool?,
  paymentMethod: json['payment_method'] as String?,
  isManualTransfer: json['is_manual_transfer'] as bool? ?? false,
  destinationBankAccounts:
      (json['destination_bank_accounts'] as List<dynamic>?)
          ?.map(
            (e) => MerchantDestinationBankAccountModel.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      const [],
  transferInstructions: json['transfer_instructions'] as String?,
  transferProofUrl: json['transfer_proof_url'] as String?,
  transferProofUploadedAt: json['transfer_proof_uploaded_at'] as String?,
  canUploadTransferProof: json['can_upload_transfer_proof'] as bool? ?? false,
  canCancel: json['can_cancel'] as bool? ?? false,
  verifiedAt: json['verified_at'] as String?,
  adminNote: json['admin_note'] as String?,
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
  'payment_method': ?instance.paymentMethod,
  'is_manual_transfer': instance.isManualTransfer,
  'destination_bank_accounts': instance.destinationBankAccounts,
  'transfer_instructions': ?instance.transferInstructions,
  'transfer_proof_url': ?instance.transferProofUrl,
  'transfer_proof_uploaded_at': ?instance.transferProofUploadedAt,
  'can_upload_transfer_proof': instance.canUploadTransferProof,
  'can_cancel': instance.canCancel,
  'verified_at': ?instance.verifiedAt,
  'admin_note': ?instance.adminNote,
  'paid_at': ?instance.paidAt,
  'expired_at': ?instance.expiredAt,
  'failed_at': ?instance.failedAt,
  'created_at': ?instance.createdAt,
  'updated_at': ?instance.updatedAt,
};

_MerchantBalanceTopUpResponseModel _$MerchantBalanceTopUpResponseModelFromJson(
  Map<String, dynamic> json,
) => _MerchantBalanceTopUpResponseModel(
  currentBalance: _intFromDynamic(json['current_balance']),
  minimumBalanceForOrders: _intFromDynamic(json['minimum_balance_for_orders']),
  isActive: json['is_active'] as bool?,
  paymentUrl: json['payment_url'] as String?,
  waitingProofCount: _intFromDynamic(json['waiting_proof_count']),
  topUp: json['top_up'] == null
      ? null
      : MerchantBalanceHistoryModel.fromJson(
          json['top_up'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$MerchantBalanceTopUpResponseModelToJson(
  _MerchantBalanceTopUpResponseModel instance,
) => <String, dynamic>{
  'current_balance': ?instance.currentBalance,
  'minimum_balance_for_orders': ?instance.minimumBalanceForOrders,
  'is_active': ?instance.isActive,
  'payment_url': ?instance.paymentUrl,
  'waiting_proof_count': ?instance.waitingProofCount,
  'top_up': ?instance.topUp,
};
