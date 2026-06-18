import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warunk/app/features/auth/domain/entity/auth_device.dart';

part 'login.freezed.dart';
part 'login.g.dart';

@freezed
sealed class Login with _$Login {
  @JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
  const factory Login.param({
    required String email,
    String? password,
    required String fcmToken,
    required String apkVersion,
    required String type,
    required String firebaseId,
    required String role,
    required AuthDeviceEntity device,
  }) = LoginParam;

  factory Login.fromJson(Map<String, Object?> json) => _$LoginFromJson(json);
}
