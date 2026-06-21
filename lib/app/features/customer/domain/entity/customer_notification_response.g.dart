// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_notification_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerNotificationResponseEntity _$CustomerNotificationResponseEntityFromJson(
  Map<String, dynamic> json,
) => CustomerNotificationResponseEntity(
  notifications:
      (json['notifications'] as List<dynamic>?)
          ?.map(
            (e) =>
                CustomerNotificationEntity.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  unreadCount: (json['unread_count'] as num?)?.toInt() ?? 0,
  pagination: json['pagination'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$CustomerNotificationResponseEntityToJson(
  CustomerNotificationResponseEntity instance,
) => <String, dynamic>{
  'notifications': instance.notifications,
  'unread_count': instance.unreadCount,
  'pagination': ?instance.pagination,
};
