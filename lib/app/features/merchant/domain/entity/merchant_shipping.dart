import 'package:freezed_annotation/freezed_annotation.dart';

part 'merchant_shipping.freezed.dart';
part 'merchant_shipping.g.dart';

@freezed
sealed class MerchantShipping with _$MerchantShipping {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory MerchantShipping.updateParam({
    required bool internalCourier,
    required bool instantCourier,
    required bool pickupAtStore,
    required int maxDistanceInternalCourier,
    required List<String> courierCodeAvailable,
  }) = MerchantShippingUpdateParam;

  factory MerchantShipping.fromJson(Map<String, dynamic> json) =>
      _$MerchantShippingFromJson(json);
}
