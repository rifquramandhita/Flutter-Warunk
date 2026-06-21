import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
sealed class User with _$User {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory User.entity({
    required String name,
    required String email,
    required String? phone,
    String? profilePhoto,
  }) = UserEntity;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
