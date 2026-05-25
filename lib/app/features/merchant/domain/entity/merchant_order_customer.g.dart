// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_order_customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantOrderCustomerEntity _$MerchantOrderCustomerEntityFromJson(
  Map<String, dynamic> json,
) => MerchantOrderCustomerEntity(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
);

Map<String, dynamic> _$MerchantOrderCustomerEntityToJson(
  MerchantOrderCustomerEntity instance,
) => <String, dynamic>{
  'id': ?instance.id,
  'name': ?instance.name,
  'email': ?instance.email,
  'phone': ?instance.phone,
};
