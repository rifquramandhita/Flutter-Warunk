import 'package:freezed_annotation/freezed_annotation.dart';

enum NotificationModelType {
  @JsonValue('order')
  order,
  @JsonValue('product')
  product,
  @JsonValue('merchant')
  merchant,
  @JsonValue('promotion')
  promotion,
  @JsonValue('merchant_balance_history')
  merchantBalanceHistory,
  @JsonValue('unknown')
  unknown;

  static NotificationModelType fromString(String? value) {
    switch (value) {
      case 'order':
        return NotificationModelType.order;
      case 'product':
        return NotificationModelType.product;
      case 'merchant':
        return NotificationModelType.merchant;
      case 'promotion':
        return NotificationModelType.promotion;
      case 'merchant_balance_history':
        return NotificationModelType.merchantBalanceHistory;
      default:
        return NotificationModelType.unknown;
    }
  }
}
