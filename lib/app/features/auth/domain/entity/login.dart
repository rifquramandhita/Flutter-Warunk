import 'package:freezed_annotation/freezed_annotation.dart';

part 'login.freezed.dart';
part 'login.g.dart';

@freezed
sealed class Login with _$Login {
  @JsonSerializable(includeIfNull: false)
  const factory Login.param({required String email, required String password}) =
      LoginParam;

  factory Login.fromJson(Map<String, Object?> json) => _$LoginFromJson(json);
}
