import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_merchant.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_promotion.dart';

part 'customer_checkout.freezed.dart';
part 'customer_checkout.g.dart';

@freezed
sealed class CustomerCheckout with _$CustomerCheckout {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory CustomerCheckout.optionEntity({
    CustomerMerchantEntity? merchant,
    String? blockingMessage,
    List<CustomerCheckoutShippingOptionEntity>? shippingOptions,
    List<CustomerCheckoutShippingOptionEntity>? biteshipShippingOptions,
    String? selectedShippingKey,
    String? selectedBiteshipRateKey,
    CustomerCheckoutShippingOptionEntity? selectedShippingOption,
    String? selectedMerchantAccountId,
    List<CustomerCheckoutPaymentMethodEntity>? paymentMethods,
    CustomerCheckoutSummaryEntity? summary,
    List<CustomerPromotionEntity>? availablePromotions,
    CustomerPromotionEntity? promotion,
  }) = CustomerCheckoutOptionEntity;

  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory CustomerCheckout.sendParam({
    required List<String> cartIds,
    String? notes,
  }) = CustomerCheckoutSendParam;

  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory CustomerCheckout.getShippingOptionParam({
    required List<String> cartIds,
    String? addressId,
    String? shippingKey,
    List<Map<String, String>>? promotions,
  }) = CustomerCheckoutGetShippingOptionParam;

  factory CustomerCheckout.fromJson(Map<String, dynamic> json) =>
      _$CustomerCheckoutFromJson(json);
}

@freezed
sealed class CustomerCheckoutShippingOption
    with _$CustomerCheckoutShippingOption {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory CustomerCheckoutShippingOption.entity({
    String? key,
    String? title,
    String? description,
    int? price,
    String? eta,
    bool? isCanUsed,
    String? disabledReason,
  }) = CustomerCheckoutShippingOptionEntity;

  factory CustomerCheckoutShippingOption.fromJson(Map<String, dynamic> json) =>
      _$CustomerCheckoutShippingOptionFromJson(json);
}

@freezed
sealed class CustomerCheckoutPaymentMethod
    with _$CustomerCheckoutPaymentMethod {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory CustomerCheckoutPaymentMethod.entity({
    String? key,
    String? label,
    String? description,
    String? bankName,
    String? accountName,
    String? accountNumber,
  }) = CustomerCheckoutPaymentMethodEntity;

  factory CustomerCheckoutPaymentMethod.fromJson(Map<String, dynamic> json) =>
      _$CustomerCheckoutPaymentMethodFromJson(json);
}

@freezed
sealed class CustomerCheckoutSummary with _$CustomerCheckoutSummary {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory CustomerCheckoutSummary.entity({
    int? totalProduct,
    int? subtotal,
    int? discount,
    int? shippingCost,
    int? serviceFee,
    int? total,
  }) = CustomerCheckoutSummaryEntity;

  factory CustomerCheckoutSummary.fromJson(Map<String, dynamic> json) =>
      _$CustomerCheckoutSummaryFromJson(json);
}
