// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_promotion_national.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantPromotionNationalEntity _$MerchantPromotionNationalEntityFromJson(
  Map<String, dynamic> json,
) => MerchantPromotionNationalEntity(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String?,
  code: json['code'] as String?,
  isShow: json['is_show'] as bool,
  isPromotionNational: json['is_promotion_national'] as bool,
  isAllMerchant: json['is_all_merchant'] as bool,
  isPublic: json['is_public'] as bool,
  isOpenToJoin: json['is_open_to_join'] as bool,
  hasJoined: json['has_joined'] as bool? ?? false,
  joinUrl: json['join_url'] as String?,
  type: json['type'] as String,
  typeLabel: json['type_label'] as String,
  discountType: json['discount_type'] as String,
  discountTypeLabel: json['discount_type_label'] as String,
  discount: json['discount'] as num,
  discountLabel: json['discount_label'] as String,
  minPurchase: json['min_purchase'] as num,
  minPurchaseLabel: json['min_purchase_label'] as String,
  maxDiscount: json['max_discount'] as num?,
  maxDiscountLabel: json['max_discount_label'] as String?,
  isUnlimitedUse: json['is_unlimited_use'] as bool,
  maxUse: (json['max_use'] as num?)?.toInt(),
  quotaLabel: json['quota_label'] as String,
  periodLabel: json['period_label'] as String,
  datetimeStart: DateTime.parse(json['datetime_start'] as String),
  datetimeEnd: DateTime.parse(json['datetime_end'] as String),
  bannerImage: json['banner_image'] as String?,
  detailUrl: json['detail_url'] as String,
  chatMessage: json['chat_message'] as String,
);

Map<String, dynamic> _$MerchantPromotionNationalEntityToJson(
  MerchantPromotionNationalEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': ?instance.description,
  'code': ?instance.code,
  'is_show': instance.isShow,
  'is_promotion_national': instance.isPromotionNational,
  'is_all_merchant': instance.isAllMerchant,
  'is_public': instance.isPublic,
  'is_open_to_join': instance.isOpenToJoin,
  'has_joined': instance.hasJoined,
  'join_url': ?instance.joinUrl,
  'type': instance.type,
  'type_label': instance.typeLabel,
  'discount_type': instance.discountType,
  'discount_type_label': instance.discountTypeLabel,
  'discount': instance.discount,
  'discount_label': instance.discountLabel,
  'min_purchase': instance.minPurchase,
  'min_purchase_label': instance.minPurchaseLabel,
  'max_discount': ?instance.maxDiscount,
  'max_discount_label': ?instance.maxDiscountLabel,
  'is_unlimited_use': instance.isUnlimitedUse,
  'max_use': ?instance.maxUse,
  'quota_label': instance.quotaLabel,
  'period_label': instance.periodLabel,
  'datetime_start': instance.datetimeStart.toIso8601String(),
  'datetime_end': instance.datetimeEnd.toIso8601String(),
  'banner_image': ?instance.bannerImage,
  'detail_url': instance.detailUrl,
  'chat_message': instance.chatMessage,
};
