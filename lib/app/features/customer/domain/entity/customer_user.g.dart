// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerUserEntity _$CustomerUserEntityFromJson(Map<String, dynamic> json) =>
    CustomerUserEntity(
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      profilePhoto: json['profile_photo'] as String?,
    );

Map<String, dynamic> _$CustomerUserEntityToJson(CustomerUserEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'profile_photo': ?instance.profilePhoto,
    };
