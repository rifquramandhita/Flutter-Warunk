import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password.freezed.dart';
part 'reset_password.g.dart';

@freezed
sealed class ResetPassword with _$ResetPassword {
  const factory ResetPassword.param({
    @JsonKey(name: 'current_password') required String currentPassword,
    required String password,
    @JsonKey(name: 'password_confirmation') required String passwordConfirmation,
  }) = ResetPasswordParam;

  factory ResetPassword.fromJson(Map<String, Object?> json) => _$ResetPasswordFromJson(json);
}
