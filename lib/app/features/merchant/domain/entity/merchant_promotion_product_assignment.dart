import 'package:freezed_annotation/freezed_annotation.dart';

part 'merchant_promotion_product_assignment.freezed.dart';
part 'merchant_promotion_product_assignment.g.dart';

@freezed
sealed class MerchantPromotionProductAssignment
    with _$MerchantPromotionProductAssignment {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory MerchantPromotionProductAssignment.entity({
    required String id,
    required String productId,
    required String productName,
    required bool allVariant,
    String? variantId,
    String? variantLabel,
  }) = MerchantPromotionProductAssignmentEntity;

  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory MerchantPromotionProductAssignment.param({
    required String productId,
    required bool allVariant,
    String? variantId,
  }) = MerchantPromotionProductAssignmentParamEntity;

  factory MerchantPromotionProductAssignment.fromJson(
    Map<String, dynamic> json,
  ) => _$MerchantPromotionProductAssignmentFromJson(json);
}
