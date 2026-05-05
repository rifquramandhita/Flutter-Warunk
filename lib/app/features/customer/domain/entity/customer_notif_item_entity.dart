import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_notif_item_entity.freezed.dart';

enum NotifType { transaction, promo, info }

@freezed
abstract class CustomerNotifItemEntity with _$CustomerNotifItemEntity {
  const factory CustomerNotifItemEntity({
    required String id,
    required String title,
    required String body,
    required NotifType type,
    required bool isRead,
    required String timeLabel,
    // Main thumbnail
    required bool hasStoreThumbnail,
    required int storeColor1,
    required int storeColor2,
    required String storeInitial,
    // Badge icon overlaid on thumbnail
    required int badgeIconCode,
    required int badgeBgColor,
    required int badgeIconColor,
    // Optional promo label
    @Default(false) bool hasPromoLabel,
    // Optional order id
    String? orderId,
  }) = _CustomerNotifItemEntity;
}
