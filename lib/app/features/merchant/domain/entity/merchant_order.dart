import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_account.dart';
import 'merchant_order_customer.dart';
import 'merchant_order_customer_address.dart';
import 'merchant_order_item.dart';
import 'merchant_order_shipping.dart';
import 'package:warunk/core/enum/order_status.dart';

part 'merchant_order.freezed.dart';
part 'merchant_order.g.dart';

@freezed
sealed class MerchantOrder with _$MerchantOrder {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory MerchantOrder.rejectParam({
    required String reason,
    required String customerBank,
    required String customerAccountNumber,
    required String customerAccountName,
    @JsonKey(includeFromJson: false, includeToJson: false) File? refundProof,
  }) = MerchantOrderRejectParam;

  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory MerchantOrder.acceptCancelParam({
    required String id,
    @JsonKey(includeFromJson: false, includeToJson: false) File? refundProof,
  }) = MerchantOrderAcceptCancelParam;

  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory MerchantOrder.rejectCancelParam({
    required String id,
    required String reason,
  }) = MerchantOrderRejectCancelParam;

  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory MerchantOrder.entity({
    required String id,
    String? invoiceNumber,
    String? invoiceUrl,
    String? merchantId,
    int? customerId,
    String? customerAddressId,
    String? merchantAccountId,
    int? subtotal,
    int? shippingCost,
    int? serviceFee,
    String? promotionId,
    String? promotionCode,
    String? promotionTitle,
    String? promotionType,
    int? promotionDiscount,
    dynamic promotion,
    List<dynamic>? promotions,
    int? total,
    int? paidAmount,
    String? paymentProof,
    String? type,
    OrderStatus? status,
    String? statusLabel,
    String? notes,
    String? cancelReason,
    String? customerBank,
    String? customerAccountNumber,
    String? customerAccountName,
    String? refundProof,
    MerchantOrderCustomerEntity? customer,
    MerchantOrderCustomerAddressEntity? customerAddress,
    MerchantAccountEntity? merchantAccount,
    @Default([]) List<MerchantOrderItemEntity> items,
    MerchantOrderShippingEntity? shipping,
    String? paidAt,
    String? cancelledAt,
    String? completedAt,
    String? createdAt,
    String? updatedAt,
  }) = MerchantOrderEntity;

  factory MerchantOrder.fromJson(Map<String, dynamic> json) =>
      _$MerchantOrderFromJson(json);
}
