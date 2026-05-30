import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_user.freezed.dart';
part 'customer_user.g.dart';

@freezed
sealed class CustomerUser with _$CustomerUser {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory CustomerUser.entity({
    required String name,
    required String email,
    required String phone,
    String? profilePhoto,
  }) = CustomerUserEntity;

  factory CustomerUser.fromJson(Map<String, Object?> json) =>
      _$CustomerUserFromJson(json);
}
