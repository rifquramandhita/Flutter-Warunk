import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_balance_history.dart';

part 'merchant_balance_history_model.freezed.dart';
part 'merchant_balance_history_model.g.dart';

@freezed
sealed class MerchantBalanceHistoryResponseModel with _$MerchantBalanceHistoryResponseModel {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory MerchantBalanceHistoryResponseModel({
    int? currentBalance,
    int? minimumBalanceForOrders,
    bool? isActive,
    @Default([]) List<MerchantBalanceHistoryModel> histories,
  }) = _MerchantBalanceHistoryResponseModel;

  factory MerchantBalanceHistoryResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MerchantBalanceHistoryResponseModelFromJson(json);
}

extension MerchantBalanceHistoryResponseModelExt on MerchantBalanceHistoryResponseModel {
  MerchantBalanceHistorySummaryEntity toEntity() {
    return MerchantBalanceHistorySummaryEntity(
      currentBalance: currentBalance,
      minimumBalanceForOrders: minimumBalanceForOrders,
      isActive: isActive,
      histories: histories.map((e) => e.toEntity()).toList(),
    );
  }
}

@freezed
sealed class MerchantBalanceHistoryModel with _$MerchantBalanceHistoryModel {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory MerchantBalanceHistoryModel({
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
  }) = _MerchantBalanceHistoryModel;

  factory MerchantBalanceHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$MerchantBalanceHistoryModelFromJson(json);
}

extension MerchantBalanceHistoryModelExt on MerchantBalanceHistoryModel {
  MerchantBalanceHistoryItemEntity toEntity() {
    return MerchantBalanceHistoryItemEntity(
      id: id,
      status: status,
      statusLabel: statusLabel,
      paymentStatus: paymentStatus,
      paymentStatusLabel: paymentStatusLabel,
      amount: amount,
      reason: reason,
      reasonLabel: reasonLabel,
      reference: reference,
      provider: provider,
      providerOrderId: providerOrderId,
      providerTransactionId: providerTransactionId,
      paymentType: paymentType,
      paymentUrl: paymentUrl,
      isPayable: isPayable,
      paidAt: paidAt,
      expiredAt: expiredAt,
      failedAt: failedAt,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
