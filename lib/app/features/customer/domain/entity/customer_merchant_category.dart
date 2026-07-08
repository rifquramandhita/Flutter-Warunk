import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_merchant_category.freezed.dart';
part 'customer_merchant_category.g.dart';

@freezed
sealed class CustomerMerchantCategory with _$CustomerMerchantCategory {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory CustomerMerchantCategory.entity({
    required String id,
    required String name,
    required String slug,
    String? iconUrl,
  }) = CustomerMerchantCategoryEntity;

  factory CustomerMerchantCategory.fromJson(Map<String, dynamic> json) =>
      _$CustomerMerchantCategoryFromJson(json);
}
