// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_promotion_product_assignment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantPromotionProductAssignmentEntity
_$MerchantPromotionProductAssignmentEntityFromJson(Map<String, dynamic> json) =>
    MerchantPromotionProductAssignmentEntity(
      id: json['id'] as String,
      productId: json['product_id'] as String,
      productName: json['product_name'] as String,
      allVariant: json['all_variant'] as bool,
      variantId: json['variant_id'] as String?,
      variantLabel: json['variant_label'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$MerchantPromotionProductAssignmentEntityToJson(
  MerchantPromotionProductAssignmentEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'product_id': instance.productId,
  'product_name': instance.productName,
  'all_variant': instance.allVariant,
  'variant_id': ?instance.variantId,
  'variant_label': ?instance.variantLabel,
  'runtimeType': instance.$type,
};

MerchantPromotionProductAssignmentParamEntity
_$MerchantPromotionProductAssignmentParamEntityFromJson(
  Map<String, dynamic> json,
) => MerchantPromotionProductAssignmentParamEntity(
  productId: json['product_id'] as String,
  allVariant: json['all_variant'] as bool,
  variantId: json['variant_id'] as String?,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$MerchantPromotionProductAssignmentParamEntityToJson(
  MerchantPromotionProductAssignmentParamEntity instance,
) => <String, dynamic>{
  'product_id': instance.productId,
  'all_variant': instance.allVariant,
  'variant_id': ?instance.variantId,
  'runtimeType': instance.$type,
};
