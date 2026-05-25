import 'package:freezed_annotation/freezed_annotation.dart';

part 'merchant_order_customer_address.freezed.dart';
part 'merchant_order_customer_address.g.dart';

@freezed
sealed class MerchantOrderCustomerAddress with _$MerchantOrderCustomerAddress {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory MerchantOrderCustomerAddress.entity({
    String? id,
    String? city,
    String? label,
    String? notes,
    String? phone,
    String? address,
    String? district,
    String? latitude,
    String? province,
    String? longitude,
    String? postalCode,
    String? recipientName,
  }) = MerchantOrderCustomerAddressEntity;

  factory MerchantOrderCustomerAddress.fromJson(Map<String, dynamic> json) =>
      _$MerchantOrderCustomerAddressFromJson(json);
}
