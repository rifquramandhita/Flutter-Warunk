import 'package:freezed_annotation/freezed_annotation.dart';

part 'merchant_promotion.freezed.dart';
part 'merchant_promotion.g.dart';

@freezed
sealed class MerchantPromotion with _$MerchantPromotion {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory MerchantPromotion.entity({
    required String id,
    String? code,
    required String title,
    required bool isShow,
    required bool isPromotionNational,
    required bool isAllMerchant,
    required String type,
    required String typeLabel,
    required DateTime datetimeStart,
    required DateTime datetimeEnd,
    required String discountType,
    required String discountTypeLabel,
    required int discount,
    required String discountLabel,
    required int minPurchase,
    int? maxDiscount,
    required String eligibility,
    required String eligibilityLabel,
    required bool isUnlimitedUse,
    int? maxUse,
    @Default([]) List<MerchantPromotionAssignmentEntity> merchantAssignments,
    @Default([]) List<MerchantPromotionProductAssignmentEntity> productAssignments,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = MerchantPromotionEntity;

  factory MerchantPromotion.fromJson(Map<String, dynamic> json) =>
      _$MerchantPromotionFromJson(json);
}

@freezed
sealed class MerchantPromotionAssignment with _$MerchantPromotionAssignment {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory MerchantPromotionAssignment.entity({
    required String id,
    required String merchantId,
    required String merchantName,
    required DateTime datetimeStart,
    required DateTime datetimeEnd,
  }) = MerchantPromotionAssignmentEntity;

  factory MerchantPromotionAssignment.fromJson(Map<String, dynamic> json) =>
      _$MerchantPromotionAssignmentFromJson(json);
}

@freezed
sealed class MerchantPromotionProductAssignment with _$MerchantPromotionProductAssignment {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory MerchantPromotionProductAssignment.entity({
    required String id,
    required String productId,
    required String productName,
    required DateTime datetimeStart,
    required DateTime datetimeEnd,
  }) = MerchantPromotionProductAssignmentEntity;

  factory MerchantPromotionProductAssignment.fromJson(Map<String, dynamic> json) =>
      _$MerchantPromotionProductAssignmentFromJson(json);
}
