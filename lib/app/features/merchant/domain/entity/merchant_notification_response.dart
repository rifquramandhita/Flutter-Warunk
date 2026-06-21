import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_notification.dart';

part 'merchant_notification_response.freezed.dart';
part 'merchant_notification_response.g.dart';

@freezed
sealed class MerchantNotificationResponse with _$MerchantNotificationResponse {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory MerchantNotificationResponse.entity({
    @Default([]) List<MerchantNotificationEntity> notifications,
    @Default(0) int unreadCount,
    Map<String, dynamic>? pagination,
  }) = MerchantNotificationResponseEntity;

  factory MerchantNotificationResponse.fromJson(Map<String, dynamic> json) =>
      _$MerchantNotificationResponseFromJson(json);
}
