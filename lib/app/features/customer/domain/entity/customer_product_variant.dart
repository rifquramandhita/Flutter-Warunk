import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_product_variant.freezed.dart';
part 'customer_product_variant.g.dart';

@freezed
sealed class CustomerProductVariant with _$CustomerProductVariant {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory CustomerProductVariant.entity({
    required String id,
    required String productId,
    required Map<String, String> variantCombination,
    String? sku,
    required int price,
    required int stock,
    required int minPurchase,
    int? weight,
    int? length,
    int? width,
    int? height,
    String? createdAt,
    String? updatedAt,
  }) = CustomerProductVariantEntity;

  factory CustomerProductVariant.fromJson(Map<String, dynamic> json) =>
      _$CustomerProductVariantFromJson(json);
}
