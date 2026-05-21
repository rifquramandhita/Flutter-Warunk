import 'package:freezed_annotation/freezed_annotation.dart';

part 'merchant_product_image.freezed.dart';
part 'merchant_product_image.g.dart';

@freezed
sealed class MerchantProductImage with _$MerchantProductImage {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory MerchantProductImage.entity({
    required String id,
    required String filePath,
    required String url,
    required String fileName,
    required int fileSize,
    required String mimeType,
    required String altText,
    required int sortOrder,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = MerchantProductImageEntity;

  factory MerchantProductImage.fromJson(Map<String, dynamic> json) =>
      _$MerchantProductImageFromJson(json);
}
