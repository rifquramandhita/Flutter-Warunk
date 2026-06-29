import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_promotion_information.freezed.dart';
part 'customer_promotion_information.g.dart';

@freezed
sealed class CustomerPromotionInformation with _$CustomerPromotionInformation {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory CustomerPromotionInformation.entity({
    String? id,
    String? type,
    String? eyebrow,
    String? title,
    String? description,
    String? image,
    String? badge,
    String? href,
    String? detailUrl,
    String? buttonLabel,
    int? sortOrder,
    String? startsAt,
    String? endsAt,
  }) = CustomerPromotionInformationEntity;

  factory CustomerPromotionInformation.fromJson(Map<String, dynamic> json) =>
      _$CustomerPromotionInformationFromJson(json);
}
