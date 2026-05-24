import 'package:freezed_annotation/freezed_annotation.dart';

part 'merchant_product_category.freezed.dart';
part 'merchant_product_category.g.dart';

@freezed
sealed class MerchantProductCategory with _$MerchantProductCategory {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory MerchantProductCategory.entity({
    required String id,
    required String name,
    required String slug,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = MerchantProductCategoryEntity;

  factory MerchantProductCategory.fromJson(Map<String, dynamic> json) =>
      _$MerchantProductCategoryFromJson(json);
}
