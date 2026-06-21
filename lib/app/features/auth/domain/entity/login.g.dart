// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginParam _$LoginParamFromJson(Map<String, dynamic> json) => LoginParam(
  email: json['email'] as String,
  password: json['password'] as String?,
  fcmToken: json['fcm_token'] as String,
  apkVersion: json['apk_version'] as String,
  type: json['type'] as String,
  firebaseId: json['firebase_id'] as String,
  role: json['role'] as String,
  device: AuthDevice.fromJson(json['device'] as Map<String, dynamic>),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$LoginParamToJson(LoginParam instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': ?instance.password,
      'fcm_token': instance.fcmToken,
      'apk_version': instance.apkVersion,
      'type': instance.type,
      'firebase_id': instance.firebaseId,
      'role': instance.role,
      'device': instance.device,
      'runtimeType': instance.$type,
    };

LoginGoogleParam _$LoginGoogleParamFromJson(Map<String, dynamic> json) =>
    LoginGoogleParam(
      email: json['email'] as String,
      name: json['name'] as String,
      role: json['role'] as String,
      device: AuthDevice.fromJson(json['device'] as Map<String, dynamic>),
      apkVersion: json['apk_version'] as String,
      type: json['type'] as String,
      firebaseId: json['firebase_id'] as String,
      fcmToken: json['fcm_token'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$LoginGoogleParamToJson(LoginGoogleParam instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'role': instance.role,
      'device': instance.device,
      'apk_version': instance.apkVersion,
      'type': instance.type,
      'firebase_id': instance.firebaseId,
      'fcm_token': instance.fcmToken,
      'runtimeType': instance.$type,
    };
