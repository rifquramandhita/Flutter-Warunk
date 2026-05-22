import 'package:freezed_annotation/freezed_annotation.dart';

part 'merchant_account.freezed.dart';
part 'merchant_account.g.dart';

@freezed
sealed class MerchantAccount with _$MerchantAccount {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory MerchantAccount.entity({
    required String id,
    required String bankName,
    required String accountName,
    required String accountNumber,
  }) = MerchantAccountEntity;

  factory MerchantAccount.fromJson(Map<String, dynamic> json) =>
      _$MerchantAccountFromJson(json);
}
