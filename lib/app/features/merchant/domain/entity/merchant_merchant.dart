import 'package:freezed_annotation/freezed_annotation.dart';

part 'merchant_merchant.freezed.dart';
part 'merchant_merchant.g.dart';

@freezed
sealed class MerchantMerchant with _$MerchantMerchant {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory MerchantMerchant.entity({
    required String id,
    required String name,
    required String slug,
    String? photo,
    required bool isOpen,
  }) = MerchantMerchantEntity;

  factory MerchantMerchant.fromJson(Map<String, dynamic> json) =>
      _$MerchantMerchantFromJson(json);
}
