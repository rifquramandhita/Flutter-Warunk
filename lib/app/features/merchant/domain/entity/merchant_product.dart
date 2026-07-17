import 'package:freezed_annotation/freezed_annotation.dart';

import 'merchant_merchant.dart';
import 'merchant_product_category.dart';
import 'merchant_product_variant.dart';
import 'merchant_product_image.dart';
import 'package:warunk/core/helper/parse_helper.dart';

part 'merchant_product.freezed.dart';
part 'merchant_product.g.dart';

@freezed
sealed class MerchantProduct with _$MerchantProduct {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory MerchantProduct.entity({
    required String id,
    required String name,
    required String slug,
    required String merchantId,
    required String productCategoryId,
    required String category,
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
    required MerchantProductCategoryEntity productCategory,
    @Default([]) List<MerchantProductVariantEntity> variants,
    @Default([]) List<MerchantProductImageEntity> images,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = MerchantProductEntity;

  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory MerchantProduct.sendParam({
    String? sendId,
    required String name,
    required String slug,
    required String category,
    required String branch,
    String? description,
    required int stock,
    required int minPurchase,
    required int price,

    @JsonKey(toJson: ParseHelper.boolToInt, fromJson: ParseHelper.intToBool)
    required bool isPublished,
    @JsonKey(toJson: ParseHelper.boolToInt, fromJson: ParseHelper.intToBool)
    required bool hasVariant,
    @JsonKey(toJson: ParseHelper.boolToInt, fromJson: ParseHelper.intToBool)
    required bool isSameDimension,
    String? sku,
    int? weight,
    int? length,
    int? width,
    int? height,
    @JsonKey(name: 'variants')
    List<MerchantProductVariantSendParam>? sendVariants,
    @JsonKey(name: 'images') List<String>? sendImages,
  }) = MerchantProductSendParam;

  factory MerchantProduct.fromJson(Map<String, dynamic> json) =>
      _$MerchantProductFromJson(json);
}
