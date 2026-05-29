import 'package:freezed_annotation/freezed_annotation.dart';

part 'merchant_promotion_assignment.freezed.dart';
part 'merchant_promotion_assignment.g.dart';

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
