import 'package:freezed_annotation/freezed_annotation.dart';

part 'merchant_category.freezed.dart';
part 'merchant_category.g.dart';

@freezed
sealed class MerchantCategory with _$MerchantCategory {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory MerchantCategory.entity({
    required String id,
    required String name,
    required String slug,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = MerchantCategoryEntity;

  factory MerchantCategory.fromJson(Map<String, dynamic> json) =>
      _$MerchantCategoryFromJson(json);
}
