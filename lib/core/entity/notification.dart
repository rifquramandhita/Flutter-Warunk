import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warunk/core/enum/notification_model_type.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

@freezed
sealed class Notification with _$Notification {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory Notification.entity({
    NotificationModelType? modelType,
    String? modelId,
  }) = NotificationEntity;

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);
}
