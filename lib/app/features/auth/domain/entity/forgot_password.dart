import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password.freezed.dart';
part 'forgot_password.g.dart';

@freezed
sealed class ForgotPassword with _$ForgotPassword {
  @JsonSerializable(includeIfNull: false)
  const factory ForgotPassword.param({required String email}) =
      ForgotPasswordParam;

  factory ForgotPassword.fromJson(Map<String, Object?> json) => _$ForgotPasswordFromJson(json);
}
