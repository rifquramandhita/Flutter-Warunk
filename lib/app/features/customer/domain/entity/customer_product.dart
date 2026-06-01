import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_merchant.dart';

part 'customer_product.freezed.dart';
part 'customer_product.g.dart';

@freezed
sealed class CustomerProduct with _$CustomerProduct {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory CustomerProduct.entity({
    required String id,
    required String name,
    required String slug,
    required String merchantId,
    required String productCategoryId,
    required String category,
    String? branch,
    String? description,
    required int stock,
    required int orderCount,
    required int minPurchase,
    required int price,
    required bool isPublished,
    required bool hasVariant,
    required bool isSameDimension,
    String? sku,
    int? weight,
    int? length,
    int? width,
    int? height,
    CustomerMerchantEntity? merchant,
    CustomerProductCategoryEntity? productCategory,
    List<CustomerProductVariantEntity>? variants,
    List<CustomerProductImageEntity>? images,
    required double rating,
    required int reviewsCount,
  }) = CustomerProductEntity;

  factory CustomerProduct.fromJson(Map<String, dynamic> json) =>
      _$CustomerProductFromJson(json);
}

@freezed
sealed class CustomerProductCategory with _$CustomerProductCategory {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory CustomerProductCategory.entity({
    required String id,
    required String name,
    required String slug,
  }) = CustomerProductCategoryEntity;

  factory CustomerProductCategory.fromJson(Map<String, dynamic> json) =>
      _$CustomerProductCategoryFromJson(json);
}

@freezed
sealed class CustomerProductVariant with _$CustomerProductVariant {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory CustomerProductVariant.entity({
    required String id,
    required String productId,
    required Map<String, String> variantCombination,
    String? sku,
    required int price,
    required int stock,
    required int minPurchase,
    int? weight,
    int? length,
    int? width,
    int? height,
  }) = CustomerProductVariantEntity;

  factory CustomerProductVariant.fromJson(Map<String, dynamic> json) =>
      _$CustomerProductVariantFromJson(json);
}

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
