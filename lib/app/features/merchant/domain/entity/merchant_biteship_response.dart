import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_biteship_response_courier.dart';

part 'merchant_biteship_response.freezed.dart';
part 'merchant_biteship_response.g.dart';

@freezed
sealed class MerchantBiteshipResponse with _$MerchantBiteshipResponse {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory MerchantBiteshipResponse.entity({
    String? id,
    num? price,
    String? object,
    String? status,
    String? message,
    bool? success,
    String? currency,
    String? referenceId,
    String? draftOrderId,
    MerchantBiteshipResponseCourierEntity? courier,
  }) = MerchantBiteshipResponseEntity;

  factory MerchantBiteshipResponse.fromJson(Map<String, dynamic> json) =>
      _$MerchantBiteshipResponseFromJson(json);
}
