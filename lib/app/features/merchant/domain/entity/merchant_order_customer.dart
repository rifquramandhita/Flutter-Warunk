import 'package:freezed_annotation/freezed_annotation.dart';

part 'merchant_order_customer.freezed.dart';
part 'merchant_order_customer.g.dart';

@freezed
sealed class MerchantOrderCustomer with _$MerchantOrderCustomer {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory MerchantOrderCustomer.entity({
    int? id,
    String? name,
    String? email,
    String? phone,
  }) = MerchantOrderCustomerEntity;

  factory MerchantOrderCustomer.fromJson(Map<String, dynamic> json) =>
      _$MerchantOrderCustomerFromJson(json);
}
