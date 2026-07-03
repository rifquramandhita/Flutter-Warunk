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
    String? slug,
    String? merchantId,
    required String category,
    String? branch,
    String? description,
    int? stock,
    int? minPurchase,
    required int price,
    bool? isPublished,
    bool? hasVariant,
    bool? isSameDimension,
    String? sku,
    int? weight,
    int? length,
    int? width,
    int? height,
    CustomerMerchantEntity? merchant,
    CustomerProductCategoryEntity? productCategory,
    List<CustomerProductVariantEntity>? variants,
    List<CustomerProductImageEntity>? images,
    double? rating,
    int? reviewsCount,
    List<dynamic>? reviews,
    bool? isWishlisted,
    String? createdAt,
    String? updatedAt,
    String? chatUrl,
  }) = CustomerProductEntity;

  factory CustomerProduct.fromJson(Map<String, dynamic> json) =>
      _$CustomerProductFromJson(json);
}
