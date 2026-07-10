// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerAddressEntity _$CustomerAddressEntityFromJson(
  Map<String, dynamic> json,
) => CustomerAddressEntity(
  id: json['id'] as String,
  userId: (json['user_id'] as num).toInt(),
  recipientName: json['recipient_name'] as String,
  phone: json['phone'] as String,
  label: json['label'] as String,
  address: json['address'] as String,
  province: json['province'] as String?,
  city: json['city'] as String?,
  district: json['district'] as String?,
  postalCode: json['postal_code'] as String,
  longitude: (json['longitude'] as num).toDouble(),
  latitude: (json['latitude'] as num).toDouble(),
  notes: json['notes'] as String?,
  isDefault: json['is_default'] as bool,
  fullAddress: json['full_address'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$CustomerAddressEntityToJson(
  CustomerAddressEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'recipient_name': instance.recipientName,
  'phone': instance.phone,
  'label': instance.label,
  'address': instance.address,
  'province': ?instance.province,
  'city': ?instance.city,
  'district': ?instance.district,
  'postal_code': instance.postalCode,
  'longitude': instance.longitude,
  'latitude': instance.latitude,
  'notes': ?instance.notes,
  'is_default': instance.isDefault,
  'full_address': instance.fullAddress,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'runtimeType': instance.$type,
};

CustomerAddressSendParam _$CustomerAddressSendParamFromJson(
  Map<String, dynamic> json,
) => CustomerAddressSendParam(
  recipientName: json['recipient_name'] as String,
  phone: json['phone'] as String,
  label: json['label'] as String,
  address: json['address'] as String,
  province: json['province'] as String,
  city: json['city'] as String,
  district: json['district'] as String,
  postalCode: json['postal_code'] as String,
  longitude: (json['longitude'] as num).toDouble(),
  latitude: (json['latitude'] as num).toDouble(),
  notes: json['notes'] as String?,
  isDefault: json['is_default'] as bool,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$CustomerAddressSendParamToJson(
  CustomerAddressSendParam instance,
) => <String, dynamic>{
  'recipient_name': instance.recipientName,
  'phone': instance.phone,
  'label': instance.label,
  'address': instance.address,
  'province': instance.province,
  'city': instance.city,
  'district': instance.district,
  'postal_code': instance.postalCode,
  'longitude': instance.longitude,
  'latitude': instance.latitude,
  'notes': ?instance.notes,
  'is_default': instance.isDefault,
  'runtimeType': instance.$type,
};
