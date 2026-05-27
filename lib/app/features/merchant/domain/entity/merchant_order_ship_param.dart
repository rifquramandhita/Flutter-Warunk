import 'package:freezed_annotation/freezed_annotation.dart';

part 'merchant_order_ship_param.freezed.dart';
part 'merchant_order_ship_param.g.dart';

@freezed
sealed class MerchantOrderShipParam with _$MerchantOrderShipParam {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory MerchantOrderShipParam.sendParam({
    String? driverName,
    String? driverPhone,
    String? trackingNumber,
    String? notes,
  }) = MerchantOrderShipSendParam;

  factory MerchantOrderShipParam.fromJson(Map<String, dynamic> json) =>
      _$MerchantOrderShipParamFromJson(json);
}
