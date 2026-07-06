import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_order_next_action.freezed.dart';
part 'customer_order_next_action.g.dart';

@freezed
sealed class CustomerOrderNextAction with _$CustomerOrderNextAction {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory CustomerOrderNextAction.entity({
    String? key,
    String? label,
    String? method,
    String? url,
  }) = CustomerOrderNextActionEntity;

  factory CustomerOrderNextAction.fromJson(Map<String, dynamic> json) =>
      _$CustomerOrderNextActionFromJson(json);
}
