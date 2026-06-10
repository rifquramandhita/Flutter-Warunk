import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_shipping.freezed.dart';
part 'customer_shipping.g.dart';

@freezed
sealed class CustomerShipping with _$CustomerShipping {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory CustomerShipping.entity({
    String? id,
    String? orderId,
    String? type,
    String? status,
    dynamic originAddress,
    dynamic destinationAddress,
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
    dynamic biteshipPayload,
    dynamic biteshipResponse,
    String? notes,
    String? shippedAt,
    String? deliveredAt,
    String? cancelledAt,
    String? createdAt,
    String? updatedAt,
  }) = CustomerShippingEntity;

  factory CustomerShipping.fromJson(Map<String, dynamic> json) =>
      _$CustomerShippingFromJson(json);
}
