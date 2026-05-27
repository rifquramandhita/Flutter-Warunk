import 'package:freezed_annotation/freezed_annotation.dart';

part 'merchant_order_reject_param.freezed.dart';
part 'merchant_order_reject_param.g.dart';

@freezed
sealed class MerchantOrderRejectParam with _$MerchantOrderRejectParam {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory MerchantOrderRejectParam.sendParam({
    required String reason,
  }) = MerchantOrderRejectSendParam;

  factory MerchantOrderRejectParam.fromJson(Map<String, dynamic> json) =>
      _$MerchantOrderRejectParamFromJson(json);
}
