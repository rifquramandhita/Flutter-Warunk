import 'package:freezed_annotation/freezed_annotation.dart';

part 'register.freezed.dart';
part 'register.g.dart';

@freezed
sealed class Register with _$Register {
  const factory Register.sendParam({
    required String name,
    required String email,
    required String phone,
    required String password,
    @JsonKey(name: 'password_confirmation')
    required String passwordConfirmation,
  }) = RegisterSendParam;

  factory Register.fromJson(Map<String, Object?> json) =>
      _$RegisterFromJson(json);
}
