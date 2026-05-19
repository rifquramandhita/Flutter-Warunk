import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
sealed class User with _$User {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory User.entity({required String name, required String email}) =
      UserEntity;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
