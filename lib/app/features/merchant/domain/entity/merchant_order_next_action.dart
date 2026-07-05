import 'package:freezed_annotation/freezed_annotation.dart';

part 'merchant_order_next_action.freezed.dart';
part 'merchant_order_next_action.g.dart';

@freezed
sealed class MerchantOrderNextAction with _$MerchantOrderNextAction {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory MerchantOrderNextAction.entity({
    String? key,
    String? label,
    String? method,
    String? url,
  }) = MerchantOrderNextActionEntity;

  factory MerchantOrderNextAction.fromJson(Map<String, dynamic> json) =>
      _$MerchantOrderNextActionFromJson(json);
}
