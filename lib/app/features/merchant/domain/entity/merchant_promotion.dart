import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_promotion_assignment.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_promotion_product_assignment.dart';

part 'merchant_promotion.freezed.dart';
part 'merchant_promotion.g.dart';

@Freezed(copyWith: false)
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
    @Default([])
    List<MerchantPromotionProductAssignmentEntity> productAssignments,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = MerchantPromotionEntity;

  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory MerchantPromotion.sendParam({
    String? code,
    required String title,
    required bool isShow,
    required String type,
    required String datetimeStart,
    required String datetimeEnd,
    required String discountType,
    required int discount,
    required int minPurchase,
    int? maxDiscount,
    required String eligibility,
    required bool isUnlimitedUse,
    int? maxUse,
    required String merchantDatetimeStart,
    required String merchantDatetimeEnd,
    @Default([])
    List<MerchantPromotionProductAssignmentParamEntity> productAssignments,
  }) = MerchantPromotionSendParam;

  factory MerchantPromotion.fromJson(Map<String, dynamic> json) =>
      _$MerchantPromotionFromJson(json);
}
