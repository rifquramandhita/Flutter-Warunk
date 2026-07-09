import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_merchant_quick_category.freezed.dart';
part 'customer_merchant_quick_category.g.dart';

@freezed
sealed class CustomerMerchantQuickCategory with _$CustomerMerchantQuickCategory {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory CustomerMerchantQuickCategory.entity({
    required String key,
    required String name,
    required String imageUrl,
  }) = CustomerMerchantQuickCategoryEntity;

  factory CustomerMerchantQuickCategory.fromJson(Map<String, dynamic> json) =>
      _$CustomerMerchantQuickCategoryFromJson(json);
}
