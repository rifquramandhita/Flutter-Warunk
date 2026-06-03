import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_product_category.freezed.dart';
part 'customer_product_category.g.dart';

@freezed
sealed class CustomerProductCategory with _$CustomerProductCategory {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory CustomerProductCategory.entity({
    required String id,
    required String name,
    required String slug,
  }) = CustomerProductCategoryEntity;

  factory CustomerProductCategory.fromJson(Map<String, dynamic> json) =>
      _$CustomerProductCategoryFromJson(json);
}
