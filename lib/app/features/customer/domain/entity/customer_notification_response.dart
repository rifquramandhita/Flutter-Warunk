import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_notification.dart';

part 'customer_notification_response.freezed.dart';
part 'customer_notification_response.g.dart';

@freezed
sealed class CustomerNotificationResponse with _$CustomerNotificationResponse {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory CustomerNotificationResponse.entity({
    @Default([]) List<CustomerNotificationEntity> notifications,
    @Default(0) int unreadCount,
    Map<String, dynamic>? pagination,
  }) = CustomerNotificationResponseEntity;

  factory CustomerNotificationResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerNotificationResponseFromJson(json);
}
