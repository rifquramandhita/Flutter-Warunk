import 'package:freezed_annotation/freezed_annotation.dart';

part 'merchant_balance_history.freezed.dart';

@freezed
sealed class MerchantBalanceHistorySummary with _$MerchantBalanceHistorySummary {
  const factory MerchantBalanceHistorySummary.entity({
    int? currentBalance,
    int? minimumBalanceForOrders,
    bool? isActive,
    @Default([]) List<MerchantBalanceHistoryItemEntity> histories,
  }) = MerchantBalanceHistorySummaryEntity;
}

@freezed
sealed class MerchantDestinationBankAccount with _$MerchantDestinationBankAccount {
  const factory MerchantDestinationBankAccount.entity({
    @Default('') String bankName,
    @Default('') String accountNumber,
    @Default('') String accountName,
  }) = MerchantDestinationBankAccountEntity;
}

@freezed
sealed class MerchantBalanceHistoryItem with _$MerchantBalanceHistoryItem {
  const factory MerchantBalanceHistoryItem.entity({
    required String id,
    String? status,
    String? statusLabel,
    String? paymentStatus,
    String? paymentStatusLabel,
    int? amount,
    String? reason,
    String? reasonLabel,
    String? reference,
    String? provider,
    String? providerOrderId,
    String? providerTransactionId,
    String? paymentType,
    String? paymentUrl,
    bool? isPayable,
    String? paymentMethod,
    @Default(false) bool isManualTransfer,
    @Default([]) List<MerchantDestinationBankAccountEntity> destinationBankAccounts,
    String? transferInstructions,
    String? transferProofUrl,
    String? transferProofUploadedAt,
    @Default(false) bool canUploadTransferProof,
    @Default(false) bool canCancel,
    String? verifiedAt,
    String? adminNote,
    String? paidAt,
    String? expiredAt,
    String? failedAt,
    String? createdAt,
    String? updatedAt,
  }) = MerchantBalanceHistoryItemEntity;
}

@freezed
sealed class MerchantBalanceTopUpResponse with _$MerchantBalanceTopUpResponse {
  const MerchantBalanceTopUpResponse._();

  const factory MerchantBalanceTopUpResponse.entity({
    int? currentBalance,
    int? minimumBalanceForOrders,
    bool? isActive,
    String? paymentUrl,
    int? waitingProofCount,
    MerchantBalanceHistoryItemEntity? topUp,
  }) = MerchantBalanceTopUpResponseEntity;

  bool get isManualTransfer => topUp?.isManualTransfer == true;
}

typedef MerchantBalanceTopUpItemEntity = MerchantBalanceHistoryItemEntity;
