import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_balance_history.dart';

part 'merchant_balance_history_model.freezed.dart';
part 'merchant_balance_history_model.g.dart';

int? _intFromDynamic(dynamic value) {
  if (value == null) return null;
  if (value is num) return value.toInt();
  return int.tryParse(value.toString());
}

String _stringFromDynamic(dynamic value) => value?.toString() ?? '';

@freezed
sealed class MerchantBalanceHistoryResponseModel with _$MerchantBalanceHistoryResponseModel {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory MerchantBalanceHistoryResponseModel({
    @JsonKey(fromJson: _intFromDynamic) int? currentBalance,
    @JsonKey(fromJson: _intFromDynamic) int? minimumBalanceForOrders,
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
sealed class MerchantDestinationBankAccountModel with _$MerchantDestinationBankAccountModel {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory MerchantDestinationBankAccountModel({
    String? bankName,
    String? accountNumber,
    String? accountName,
  }) = _MerchantDestinationBankAccountModel;

  factory MerchantDestinationBankAccountModel.fromJson(Map<String, dynamic> json) =>
      _$MerchantDestinationBankAccountModelFromJson(json);
}

extension MerchantDestinationBankAccountModelExt on MerchantDestinationBankAccountModel {
  MerchantDestinationBankAccountEntity toEntity() {
    return MerchantDestinationBankAccountEntity(
      bankName: bankName ?? '',
      accountNumber: accountNumber ?? '',
      accountName: accountName ?? '',
    );
  }
}

@freezed
sealed class MerchantBalanceHistoryModel with _$MerchantBalanceHistoryModel {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory MerchantBalanceHistoryModel({
    @JsonKey(fromJson: _stringFromDynamic) required String id,
    String? status,
    String? statusLabel,
    String? paymentStatus,
    String? paymentStatusLabel,
    @JsonKey(fromJson: _intFromDynamic) int? amount,
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
    @Default([]) List<MerchantDestinationBankAccountModel> destinationBankAccounts,
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
      paymentMethod: paymentMethod,
      isManualTransfer: isManualTransfer,
      destinationBankAccounts:
          destinationBankAccounts.map((e) => e.toEntity()).toList(),
      transferInstructions: transferInstructions,
      transferProofUrl: transferProofUrl,
      transferProofUploadedAt: transferProofUploadedAt,
      canUploadTransferProof: canUploadTransferProof,
      canCancel: canCancel,
      verifiedAt: verifiedAt,
      adminNote: adminNote,
      paidAt: paidAt,
      expiredAt: expiredAt,
      failedAt: failedAt,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

@freezed
sealed class MerchantBalanceTopUpResponseModel with _$MerchantBalanceTopUpResponseModel {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory MerchantBalanceTopUpResponseModel({
    @JsonKey(fromJson: _intFromDynamic) int? currentBalance,
    @JsonKey(fromJson: _intFromDynamic) int? minimumBalanceForOrders,
    bool? isActive,
    String? paymentUrl,
    @JsonKey(fromJson: _intFromDynamic) int? waitingProofCount,
    MerchantBalanceHistoryModel? topUp,
  }) = _MerchantBalanceTopUpResponseModel;

  factory MerchantBalanceTopUpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MerchantBalanceTopUpResponseModelFromJson(json);
}

extension MerchantBalanceTopUpResponseModelExt on MerchantBalanceTopUpResponseModel {
  MerchantBalanceTopUpResponseEntity toEntity() {
    return MerchantBalanceTopUpResponseEntity(
      currentBalance: currentBalance,
      minimumBalanceForOrders: minimumBalanceForOrders,
      isActive: isActive,
      paymentUrl: paymentUrl ?? topUp?.paymentUrl,
      waitingProofCount: waitingProofCount,
      topUp: topUp?.toEntity(),
    );
  }
}
