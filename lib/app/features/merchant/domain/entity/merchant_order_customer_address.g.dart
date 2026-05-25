// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_order_customer_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantOrderCustomerAddressEntity _$MerchantOrderCustomerAddressEntityFromJson(
  Map<String, dynamic> json,
) => MerchantOrderCustomerAddressEntity(
  id: json['id'] as String?,
  city: json['city'] as String?,
  label: json['label'] as String?,
  notes: json['notes'] as String?,
  phone: json['phone'] as String?,
  address: json['address'] as String?,
  district: json['district'] as String?,
  latitude: json['latitude'] as String?,
  province: json['province'] as String?,
  longitude: json['longitude'] as String?,
  postalCode: json['postal_code'] as String?,
  recipientName: json['recipient_name'] as String?,
);

Map<String, dynamic> _$MerchantOrderCustomerAddressEntityToJson(
  MerchantOrderCustomerAddressEntity instance,
) => <String, dynamic>{
  'id': ?instance.id,
  'city': ?instance.city,
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
