import 'package:freezed_annotation/freezed_annotation.dart';

part 'merchant_biteship_response_courier.freezed.dart';
part 'merchant_biteship_response_courier.g.dart';

@freezed
sealed class MerchantBiteshipResponseCourier with _$MerchantBiteshipResponseCourier {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory MerchantBiteshipResponseCourier.entity({
    String? link,
    String? name,
    String? type,
    String? phone,
    String? company,
    String? waybillId,
    String? trackingId,
    String? routingCode,
  }) = MerchantBiteshipResponseCourierEntity;

  factory MerchantBiteshipResponseCourier.fromJson(Map<String, dynamic> json) =>
      _$MerchantBiteshipResponseCourierFromJson(json);
}
