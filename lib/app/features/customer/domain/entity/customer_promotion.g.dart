// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_promotion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerPromotionEntity _$CustomerPromotionEntityFromJson(
  Map<String, dynamic> json,
) => CustomerPromotionEntity(
  id: json['id'] as String?,
  code: json['code'] as String?,
  title: json['title'] as String?,
  type: json['type'] as String?,
  typeLabel: json['type_label'] as String?,
  discountType: json['discount_type'] as String?,
  discountTypeLabel: json['discount_type_label'] as String?,
  discountValue: (json['discount_value'] as num?)?.toInt(),
  discount: (json['discount'] as num?)?.toInt(),
  discountLabel: json['discount_label'] as String?,
  minPurchase: (json['min_purchase'] as num?)?.toInt(),
  maxDiscount: (json['max_discount'] as num?)?.toInt(),
  eligibility: json['eligibility'] as String?,
  eligibilityLabel: json['eligibility_label'] as String?,
  isShow: json['is_show'] as bool?,
  isUnlimitedUse: json['is_unlimited_use'] as bool?,
  maxUse: (json['max_use'] as num?)?.toInt(),
);

Map<String, dynamic> _$CustomerPromotionEntityToJson(
  CustomerPromotionEntity instance,
) => <String, dynamic>{
  'id': ?instance.id,
  'code': ?instance.code,
  'title': ?instance.title,
  'type': ?instance.type,
  'type_label': ?instance.typeLabel,
  'discount_type': ?instance.discountType,
  'discount_type_label': ?instance.discountTypeLabel,
  'discount_value': ?instance.discountValue,
  'discount': ?instance.discount,
  'discount_label': ?instance.discountLabel,
  'min_purchase': ?instance.minPurchase,
  'max_discount': ?instance.maxDiscount,
  'eligibility': ?instance.eligibility,
  'eligibility_label': ?instance.eligibilityLabel,
  'is_show': ?instance.isShow,
  'is_unlimited_use': ?instance.isUnlimitedUse,
  'max_use': ?instance.maxUse,
};
