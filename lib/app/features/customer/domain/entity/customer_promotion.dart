import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_promotion.freezed.dart';
part 'customer_promotion.g.dart';

@freezed
sealed class CustomerPromotion with _$CustomerPromotion {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory CustomerPromotion.entity({
    String? id,
    String? code,
    String? title,
    String? type,
    String? typeLabel,
    String? discountType,
    String? discountTypeLabel,
    int? discountValue,
    int? discount,
    String? discountLabel,
    int? minPurchase,
    int? maxDiscount,
    String? eligibility,
    String? eligibilityLabel,
    bool? isShow,
    bool? isUnlimitedUse,
    int? maxUse,
  }) = CustomerPromotionEntity;

  factory CustomerPromotion.fromJson(Map<String, dynamic> json) =>
      _$CustomerPromotionFromJson(json);
}
