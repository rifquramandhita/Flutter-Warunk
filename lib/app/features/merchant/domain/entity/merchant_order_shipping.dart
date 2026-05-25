import 'package:freezed_annotation/freezed_annotation.dart';

part 'merchant_order_shipping.freezed.dart';
part 'merchant_order_shipping.g.dart';

@freezed
sealed class MerchantOrderShipping with _$MerchantOrderShipping {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory MerchantOrderShipping.entity({
    String? id,
    String? orderId,
    String? type,
    String? status,
    MerchantOrderShippingAddressEntity? originAddress,
    MerchantOrderShippingAddressEntity? destinationAddress,
    String? courier,
    String? courierCode,
    String? service,
    String? serviceCode,
    String? driverName,
    String? driverPhone,
    String? driverVehicleNumber,
    String? trackingNumber,
    bool? isInstant,
    String? pickupPhoto,
    String? deliveryPhoto,
    String? biteshipOrderId,
    num? shippingCost,
    Map<String, dynamic>? biteshipPayload,
    Map<String, dynamic>? biteshipResponse,
    String? notes,
    String? shippedAt,
    String? deliveredAt,
    String? cancelledAt,
    String? createdAt,
    String? updatedAt,
  }) = MerchantOrderShippingEntity;

  factory MerchantOrderShipping.fromJson(Map<String, dynamic> json) =>
      _$MerchantOrderShippingFromJson(json);
}

@freezed
sealed class MerchantOrderShippingAddress with _$MerchantOrderShippingAddress {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory MerchantOrderShippingAddress.entity({
    String? id,
    String? city,
    String? name,
    String? label,
    String? notes,
    String? phone,
    String? address,
    String? district,
    dynamic latitude,
    String? province,
    dynamic longitude,
    String? postalCode,
    String? recipientName,
  }) = MerchantOrderShippingAddressEntity;

  factory MerchantOrderShippingAddress.fromJson(Map<String, dynamic> json) =>
      _$MerchantOrderShippingAddressFromJson(json);
}
