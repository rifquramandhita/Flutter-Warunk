import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_merchant.freezed.dart';
part 'customer_merchant.g.dart';

@freezed
sealed class CustomerMerchant with _$CustomerMerchant {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory CustomerMerchant.entity({
    required String id,
    required String name,
    required String slug,
    required String photo,
    required bool isActive,
    required bool isOpen,
  }) = CustomerMerchantEntity;

  factory CustomerMerchant.fromJson(Map<String, dynamic> json) =>
      _$CustomerMerchantFromJson(json);
}
