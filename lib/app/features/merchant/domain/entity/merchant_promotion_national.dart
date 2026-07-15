import 'package:freezed_annotation/freezed_annotation.dart';

part 'merchant_promotion_national.freezed.dart';
part 'merchant_promotion_national.g.dart';

@Freezed(copyWith: false)
sealed class MerchantPromotionNational with _$MerchantPromotionNational {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory MerchantPromotionNational.entity({
    required String id,
    required String title,
    String? description,
    String? code,
    required bool isShow,
    required bool isPromotionNational,
    required bool isAllMerchant,
    required bool isPublic,
    required bool isOpenToJoin,
    @Default(false) bool hasJoined,
    String? joinUrl,
    required String type,
    required String typeLabel,
    required String discountType,
    required String discountTypeLabel,
    required num discount,
    required String discountLabel,
    required num minPurchase,
    required String minPurchaseLabel,
    num? maxDiscount,
    String? maxDiscountLabel,
    required bool isUnlimitedUse,
    int? maxUse,
    required String quotaLabel,
    required String periodLabel,
    required DateTime datetimeStart,
    required DateTime datetimeEnd,
    String? bannerImage,
    required String detailUrl,
    required String chatMessage,
  }) = MerchantPromotionNationalEntity;

  factory MerchantPromotionNational.fromJson(Map<String, dynamic> json) =>
      _$MerchantPromotionNationalFromJson(json);
}
