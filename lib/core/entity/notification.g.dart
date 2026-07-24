// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationEntity _$NotificationEntityFromJson(Map<String, dynamic> json) =>
    NotificationEntity(
      indicator: $enumDecodeNullable(
        _$NotificationIndicatorEntityEnumMap,
        json['indicator'],
      ),
      modelId: json['model_id'] as String?,
    );

Map<String, dynamic> _$NotificationEntityToJson(NotificationEntity instance) =>
    <String, dynamic>{
      'indicator': ?_$NotificationIndicatorEntityEnumMap[instance.indicator],
      'model_id': ?instance.modelId,
    };

const _$NotificationIndicatorEntityEnumMap = {
  NotificationIndicatorEntity.userOrderStatus: 'user_order_status',
  NotificationIndicatorEntity.userCartRestock: 'user_cart_restock',
  NotificationIndicatorEntity.userWishlistRestock: 'user_wishlist_restock',
  NotificationIndicatorEntity.userCartOutOfStock: 'user_cart_out_of_stock',
  NotificationIndicatorEntity.userWishlistOutOfStock:
      'user_wishlist_out_of_stock',
  NotificationIndicatorEntity.userProductPromotion: 'user_product_promotion',
  NotificationIndicatorEntity.userNationalPromotion: 'user_national_promotion',
  NotificationIndicatorEntity.userCheckoutAvailable: 'user_checkout_available',
  NotificationIndicatorEntity.userIncomingChat: 'user_incoming_chat',
  NotificationIndicatorEntity.merchantNewOrder: 'merchant_new_order',
  NotificationIndicatorEntity.merchantLowBalance: 'merchant_low_balance',
  NotificationIndicatorEntity.merchantTopUpSuccess: 'merchant_top_up_success',
  NotificationIndicatorEntity.merchantCheckoutBlocked:
      'merchant_checkout_blocked',
  NotificationIndicatorEntity.merchantSuspended: 'merchant_suspended',
  NotificationIndicatorEntity.merchantPromoInvitation:
      'merchant_promo_invitation',
  NotificationIndicatorEntity.merchantIncomingChat: 'merchant_incoming_chat',
  NotificationIndicatorEntity.unknown: 'unknown',
};
