// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerNotificationEntity _$CustomerNotificationEntityFromJson(
  Map<String, dynamic> json,
) => CustomerNotificationEntity(
  id: json['id'] as String,
  type: json['type'] as String?,
  indicator: json['indicator'] as String?,
  title: json['title'] as String?,
  description: json['description'] as String?,
  actionUrl: json['action_url'] as String?,
  priority: json['priority'] as String?,
  data: json['data'] as Map<String, dynamic>?,
  isRead: json['is_read'] as bool? ?? false,
  readAt: json['read_at'] as String?,
  createdAt: json['created_at'] as String?,
);

Map<String, dynamic> _$CustomerNotificationEntityToJson(
  CustomerNotificationEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'type': ?instance.type,
  'indicator': ?instance.indicator,
  'title': ?instance.title,
  'description': ?instance.description,
  'action_url': ?instance.actionUrl,
  'priority': ?instance.priority,
  'data': ?instance.data,
  'is_read': instance.isRead,
  'read_at': ?instance.readAt,
  'created_at': ?instance.createdAt,
};
