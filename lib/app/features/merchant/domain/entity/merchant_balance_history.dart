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
    String? paidAt,
    String? expiredAt,
    String? failedAt,
    String? createdAt,
    String? updatedAt,
  }) = MerchantBalanceHistoryItemEntity;
}
