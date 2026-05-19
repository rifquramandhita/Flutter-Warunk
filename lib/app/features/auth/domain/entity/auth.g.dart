// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthEntity _$AuthEntityFromJson(Map<String, dynamic> json) => AuthEntity(
  token: json['token'] as String,
  tokenType: json['token_type'] as String,
  user: UserEntity.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AuthEntityToJson(AuthEntity instance) =>
    <String, dynamic>{
      'token': instance.token,
      'token_type': instance.tokenType,
      'user': instance.user,
    };
