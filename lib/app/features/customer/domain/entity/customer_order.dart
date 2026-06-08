import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';

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

  factory CustomerOrder.fromJson(Map<String, dynamic> json) =>
      _$CustomerOrderFromJson(json);
}
