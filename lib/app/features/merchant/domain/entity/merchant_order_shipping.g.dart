// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_order_shipping.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantOrderShippingEntity _$MerchantOrderShippingEntityFromJson(
  Map<String, dynamic> json,
) => MerchantOrderShippingEntity(
  id: json['id'] as String?,
  orderId: json['order_id'] as String?,
  type: json['type'] as String?,
  status: json['status'] as String?,
  originAddress: json['origin_address'] == null
      ? null
      : MerchantOrderShippingAddressEntity.fromJson(
          json['origin_address'] as Map<String, dynamic>,
        ),
  destinationAddress: json['destination_address'] == null
      ? null
      : MerchantOrderShippingAddressEntity.fromJson(
          json['destination_address'] as Map<String, dynamic>,
        ),
  courier: json['courier'] as String?,
  courierCode: json['courier_code'] as String?,
  service: json['service'] as String?,
  serviceCode: json['service_code'] as String?,
  driverName: json['driver_name'] as String?,
  driverPhone: json['driver_phone'] as String?,
  driverVehicleNumber: json['driver_vehicle_number'] as String?,
  trackingNumber: json['tracking_number'] as String?,
  isInstant: json['is_instant'] as bool?,
  pickupPhoto: json['pickup_photo'] as String?,
  deliveryPhoto: json['delivery_photo'] as String?,
  biteshipOrderId: json['biteship_order_id'] as String?,
  shippingCost: json['shipping_cost'] as num?,
  biteshipPayload: json['biteship_payload'] as Map<String, dynamic>?,
  biteshipResponse: json['biteship_response'] as Map<String, dynamic>?,
  notes: json['notes'] as String?,
  shippedAt: json['shipped_at'] as String?,
  deliveredAt: json['delivered_at'] as String?,
  cancelledAt: json['cancelled_at'] as String?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$MerchantOrderShippingEntityToJson(
  MerchantOrderShippingEntity instance,
) => <String, dynamic>{
  'id': ?instance.id,
  'order_id': ?instance.orderId,
  'type': ?instance.type,
  'status': ?instance.status,
  'origin_address': ?instance.originAddress,
  'destination_address': ?instance.destinationAddress,
  'courier': ?instance.courier,
  'courier_code': ?instance.courierCode,
  'service': ?instance.service,
  'service_code': ?instance.serviceCode,
  'driver_name': ?instance.driverName,
  'driver_phone': ?instance.driverPhone,
  'driver_vehicle_number': ?instance.driverVehicleNumber,
  'tracking_number': ?instance.trackingNumber,
  'is_instant': ?instance.isInstant,
  'pickup_photo': ?instance.pickupPhoto,
  'delivery_photo': ?instance.deliveryPhoto,
  'biteship_order_id': ?instance.biteshipOrderId,
  'shipping_cost': ?instance.shippingCost,
  'biteship_payload': ?instance.biteshipPayload,
  'biteship_response': ?instance.biteshipResponse,
  'notes': ?instance.notes,
  'shipped_at': ?instance.shippedAt,
  'delivered_at': ?instance.deliveredAt,
  'cancelled_at': ?instance.cancelledAt,
  'created_at': ?instance.createdAt,
  'updated_at': ?instance.updatedAt,
};

MerchantOrderShippingAddressEntity _$MerchantOrderShippingAddressEntityFromJson(
  Map<String, dynamic> json,
) => MerchantOrderShippingAddressEntity(
  id: json['id'] as String?,
  city: json['city'] as String?,
  name: json['name'] as String?,
  label: json['label'] as String?,
  notes: json['notes'] as String?,
  phone: json['phone'] as String?,
  address: json['address'] as String?,
  district: json['district'] as String?,
  latitude: json['latitude'],
  province: json['province'] as String?,
  longitude: json['longitude'],
  postalCode: json['postal_code'] as String?,
  recipientName: json['recipient_name'] as String?,
);

Map<String, dynamic> _$MerchantOrderShippingAddressEntityToJson(
  MerchantOrderShippingAddressEntity instance,
) => <String, dynamic>{
  'id': ?instance.id,
  'city': ?instance.city,
  'name': ?instance.name,
  'label': ?instance.label,
  'notes': ?instance.notes,
  'phone': ?instance.phone,
  'address': ?instance.address,
  'district': ?instance.district,
  'latitude': ?instance.latitude,
  'province': ?instance.province,
  'longitude': ?instance.longitude,
  'postal_code': ?instance.postalCode,
  'recipient_name': ?instance.recipientName,
};
