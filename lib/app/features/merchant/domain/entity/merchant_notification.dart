import 'package:freezed_annotation/freezed_annotation.dart';

part 'merchant_notification.freezed.dart';
part 'merchant_notification.g.dart';

@freezed
sealed class MerchantNotification with _$MerchantNotification {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory MerchantNotification.entity({
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
  }) = MerchantNotificationEntity;

  factory MerchantNotification.fromJson(Map<String, dynamic> json) =>
      _$MerchantNotificationFromJson(json);
}
