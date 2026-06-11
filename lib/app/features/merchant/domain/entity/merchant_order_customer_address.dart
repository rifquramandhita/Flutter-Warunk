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
    double? latitude,
    String? province,
    double? longitude,
    String? postalCode,
    String? recipientName,
    int? userId,
    bool? isDefault,
    String? fullAddress,
    String? createdAt,
    String? updatedAt,
  }) = MerchantOrderCustomerAddressEntity;

  factory MerchantOrderCustomerAddress.fromJson(Map<String, dynamic> json) =>
      _$MerchantOrderCustomerAddressFromJson(json);
}
