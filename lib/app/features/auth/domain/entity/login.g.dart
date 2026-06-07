// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginParam _$LoginParamFromJson(Map<String, dynamic> json) => LoginParam(
  email: json['email'] as String,
  password: json['password'] as String,
  fcmToken: json['fcm_token'] as String,
  apkVersion: json['apk_version'] as String,
  type: json['type'] as String,
  firebaseId: json['firebase_id'] as String,
  device: AuthDeviceEntity.fromJson(json['device'] as Map<String, dynamic>),
);

Map<String, dynamic> _$LoginParamToJson(LoginParam instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'fcm_token': instance.fcmToken,
      'apk_version': instance.apkVersion,
      'type': instance.type,
      'firebase_id': instance.firebaseId,
      'device': instance.device,
    };
