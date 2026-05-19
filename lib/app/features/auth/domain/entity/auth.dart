import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warunk/app/features/auth/domain/entity/user.dart';

part 'auth.freezed.dart';
part 'auth.g.dart';

@freezed
sealed class Auth with _$Auth {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Auth.entity({
    required String token,
    required String tokenType,
    required UserEntity user,
  }) = AuthEntity;

  factory Auth.fromJson(Map<String, Object?> json) => _$AuthFromJson(json);
}
