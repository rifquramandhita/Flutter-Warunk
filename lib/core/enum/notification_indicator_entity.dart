import 'package:freezed_annotation/freezed_annotation.dart';

enum NotificationIndicatorEntity {
  @JsonValue('user_order_status')
  userOrderStatus,
  @JsonValue('user_cart_restock')
  userCartRestock,
  @JsonValue('user_wishlist_restock')
  userWishlistRestock,
  @JsonValue('user_cart_out_of_stock')
  userCartOutOfStock,
  @JsonValue('user_wishlist_out_of_stock')
  userWishlistOutOfStock,
  @JsonValue('user_product_promotion')
  userProductPromotion,
  @JsonValue('user_national_promotion')
  userNationalPromotion,
  @JsonValue('user_checkout_available')
  userCheckoutAvailable,
  @JsonValue('user_incoming_chat')
  userIncomingChat,
  @JsonValue('merchant_new_order')
  merchantNewOrder,
  @JsonValue('merchant_low_balance')
  merchantLowBalance,
  @JsonValue('merchant_top_up_success')
  merchantTopUpSuccess,
  @JsonValue('merchant_checkout_blocked')
  merchantCheckoutBlocked,
  @JsonValue('merchant_suspended')
  merchantSuspended,
  @JsonValue('merchant_promo_invitation')
  merchantPromoInvitation,
  @JsonValue('merchant_incoming_chat')
  merchantIncomingChat,
  @JsonValue('unknown')
  unknown;

  static NotificationIndicatorEntity fromString(String? value) {
    switch (value) {
      case 'user_order_status':
        return NotificationIndicatorEntity.userOrderStatus;
      case 'user_cart_restock':
        return NotificationIndicatorEntity.userCartRestock;
      case 'user_wishlist_restock':
        return NotificationIndicatorEntity.userWishlistRestock;
      case 'user_cart_out_of_stock':
        return NotificationIndicatorEntity.userCartOutOfStock;
      case 'user_wishlist_out_of_stock':
        return NotificationIndicatorEntity.userWishlistOutOfStock;
      case 'user_product_promotion':
        return NotificationIndicatorEntity.userProductPromotion;
      case 'user_national_promotion':
        return NotificationIndicatorEntity.userNationalPromotion;
      case 'user_checkout_available':
        return NotificationIndicatorEntity.userCheckoutAvailable;
      case 'user_incoming_chat':
        return NotificationIndicatorEntity.userIncomingChat;
      case 'merchant_new_order':
        return NotificationIndicatorEntity.merchantNewOrder;
      case 'merchant_low_balance':
        return NotificationIndicatorEntity.merchantLowBalance;
      case 'merchant_top_up_success':
        return NotificationIndicatorEntity.merchantTopUpSuccess;
      case 'merchant_checkout_blocked':
        return NotificationIndicatorEntity.merchantCheckoutBlocked;
      case 'merchant_suspended':
        return NotificationIndicatorEntity.merchantSuspended;
      case 'merchant_promo_invitation':
        return NotificationIndicatorEntity.merchantPromoInvitation;
      case 'merchant_incoming_chat':
        return NotificationIndicatorEntity.merchantIncomingChat;
      default:
        return NotificationIndicatorEntity.unknown;
    }
  }
}
