import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_notification.freezed.dart';
part 'customer_notification.g.dart';

@freezed
sealed class CustomerNotification with _$CustomerNotification {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory CustomerNotification.entity({
    required String id,
    String? type,
    String? indicator,
    String? title,
    String? description,
    String? actionUrl,
    String? priority,
    Map<String, dynamic>? data,
    @Default(false) bool isRead,
    String? readAt,
    String? createdAt,
  }) = CustomerNotificationEntity;

  factory CustomerNotification.fromJson(Map<String, dynamic> json) =>
      _$CustomerNotificationFromJson(json);
}
