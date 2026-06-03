import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_merchant.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_product_category.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_product_variant.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_product_image.dart';

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
    List<dynamic>? reviews,
    String? createdAt,
    String? updatedAt,
  }) = CustomerProductEntity;

  factory CustomerProduct.fromJson(Map<String, dynamic> json) =>
      _$CustomerProductFromJson(json);
}
