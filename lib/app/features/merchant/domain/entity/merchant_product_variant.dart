import 'package:freezed_annotation/freezed_annotation.dart';

part 'merchant_product_variant.freezed.dart';
part 'merchant_product_variant.g.dart';

@freezed
sealed class MerchantProductVariant with _$MerchantProductVariant {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory MerchantProductVariant.entity({
    required String id,
    required String productId,
    required Map<String, dynamic> variantCombination,
    String? sku,
    required int price,
    required int stock,
    required int minPurchase,
    int? weight,
    int? length,
    int? width,
    int? height,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = MerchantProductVariantEntity;

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory MerchantProductVariant.sendParam({
    required Map<String, dynamic> variantCombination,
    String? sku,
    required int price,
    required int stock,
    required int minPurchase,
    int? weight,
    int? length,
    int? width,
    int? height,
  }) = MerchantProductVariantSendParam;

  factory MerchantProductVariant.fromJson(Map<String, dynamic> json) =>
      _$MerchantProductVariantFromJson(json);
}
