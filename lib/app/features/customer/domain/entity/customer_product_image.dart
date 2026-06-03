import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_product_image.freezed.dart';
part 'customer_product_image.g.dart';

@freezed
sealed class CustomerProductImage with _$CustomerProductImage {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory CustomerProductImage.entity({
    required String id,
    required String filePath,
    required String url,
    required String fileName,
    required int fileSize,
    required String mimeType,
    required String altText,
    required int sortOrder,
  }) = CustomerProductImageEntity;

  factory CustomerProductImage.fromJson(Map<String, dynamic> json) =>
      _$CustomerProductImageFromJson(json);
}
