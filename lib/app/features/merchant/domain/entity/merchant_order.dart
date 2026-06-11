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
  const factory MerchantOrder.entity({
    required String id,
    String? invoiceNumber,
    String? invoiceUrl,
    String? merchantId,
    int? customerId,
    String? customerAddressId,
    String? merchantAccountId,
    num? subtotal,
    num? shippingCost,
    num? serviceFee,
    num? total,
    num? paidAmount,
    String? paymentProof,
    String? type,
    OrderStatus? status,
    String? statusLabel,
    String? notes,
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
