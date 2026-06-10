import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_shipping.dart';

part 'customer_order.g.dart';
part 'customer_order.freezed.dart';

@freezed
sealed class CustomerOrder with _$CustomerOrder {
  const factory CustomerOrder.createParam({
    required String addressId,
    String? shippingKey,
    String? biteshipRateKey,
    String? merchantAccountId,
    String? notes,
    required String paymentProof,
    required List<String> cartIds,
    String? promotionId,
    String? promotionCode,
  }) = CustomerOrderCreateParam;

  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory CustomerOrder.getPromotionParam({
    required List<String> cartIds,
    String? addressId,
    String? shippingKey,
    String? biteshipRateKey,
  }) = CustomerOrderGetPromotionParam;

  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory CustomerOrder.entity({
    String? id,
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
    String? status,
    String? statusLabel,
    String? notes,
    String? cancelReason,
    String? customerBank,
    String? customerAccountNumber,
    String? customerAccountName,
    String? refundProof,
    dynamic customer,
    dynamic customerAddress,
    dynamic merchantAccount,
    dynamic merchant,
    List<dynamic>? items,
    List<dynamic>? reviews,
    bool? needsReview,
    CustomerShippingEntity? shipping,
    String? paidAt,
    String? cancelledAt,
    String? completedAt,
    String? createdAt,
    String? updatedAt,
  }) = CustomerOrderEntity;

  factory CustomerOrder.fromJson(Map<String, dynamic> json) =>
      _$CustomerOrderFromJson(json);
}
