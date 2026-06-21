// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_notification_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantNotificationResponseEntity _$MerchantNotificationResponseEntityFromJson(
  Map<String, dynamic> json,
) => MerchantNotificationResponseEntity(
  notifications:
      (json['notifications'] as List<dynamic>?)
          ?.map(
            (e) =>
                MerchantNotificationEntity.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  unreadCount: (json['unread_count'] as num?)?.toInt() ?? 0,
  pagination: json['pagination'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$MerchantNotificationResponseEntityToJson(
  MerchantNotificationResponseEntity instance,
) => <String, dynamic>{
  'notifications': instance.notifications,
  'unread_count': instance.unreadCount,
  'pagination': ?instance.pagination,
};
