// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_promotion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantPromotionEntity _$MerchantPromotionEntityFromJson(
  Map<String, dynamic> json,
) => MerchantPromotionEntity(
  id: json['id'] as String,
  code: json['code'] as String?,
  title: json['title'] as String,
  isShow: json['is_show'] as bool,
  isPromotionNational: json['is_promotion_national'] as bool,
  isAllMerchant: json['is_all_merchant'] as bool,
  type: json['type'] as String,
  typeLabel: json['type_label'] as String,
  datetimeStart: DateTime.parse(json['datetime_start'] as String),
  datetimeEnd: DateTime.parse(json['datetime_end'] as String),
  discountType: json['discount_type'] as String,
  discountTypeLabel: json['discount_type_label'] as String,
  discount: (json['discount'] as num).toInt(),
  discountLabel: json['discount_label'] as String,
  minPurchase: (json['min_purchase'] as num).toInt(),
  maxDiscount: (json['max_discount'] as num?)?.toInt(),
  eligibility: json['eligibility'] as String,
  eligibilityLabel: json['eligibility_label'] as String,
  isUnlimitedUse: json['is_unlimited_use'] as bool,
  maxUse: (json['max_use'] as num?)?.toInt(),
  merchantAssignments:
      (json['merchant_assignments'] as List<dynamic>?)
          ?.map(
            (e) => MerchantPromotionAssignmentEntity.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      const [],
  productAssignments:
      (json['product_assignments'] as List<dynamic>?)
          ?.map(
            (e) => MerchantPromotionProductAssignmentEntity.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      const [],
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$MerchantPromotionEntityToJson(
  MerchantPromotionEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'code': ?instance.code,
  'title': instance.title,
  'is_show': instance.isShow,
  'is_promotion_national': instance.isPromotionNational,
  'is_all_merchant': instance.isAllMerchant,
  'type': instance.type,
  'type_label': instance.typeLabel,
  'datetime_start': instance.datetimeStart.toIso8601String(),
  'datetime_end': instance.datetimeEnd.toIso8601String(),
  'discount_type': instance.discountType,
  'discount_type_label': instance.discountTypeLabel,
  'discount': instance.discount,
  'discount_label': instance.discountLabel,
  'min_purchase': instance.minPurchase,
  'max_discount': ?instance.maxDiscount,
  'eligibility': instance.eligibility,
  'eligibility_label': instance.eligibilityLabel,
  'is_unlimited_use': instance.isUnlimitedUse,
  'max_use': ?instance.maxUse,
  'merchant_assignments': instance.merchantAssignments,
  'product_assignments': instance.productAssignments,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'runtimeType': instance.$type,
};

MerchantPromotionSendParam _$MerchantPromotionSendParamFromJson(
  Map<String, dynamic> json,
) => MerchantPromotionSendParam(
  code: json['code'] as String?,
  title: json['title'] as String,
  isShow: json['is_show'] as bool,
  type: json['type'] as String,
  datetimeStart: json['datetime_start'] as String,
  datetimeEnd: json['datetime_end'] as String,
  discountType: json['discount_type'] as String,
  discount: (json['discount'] as num).toInt(),
  minPurchase: (json['min_purchase'] as num).toInt(),
  maxDiscount: (json['max_discount'] as num?)?.toInt(),
  eligibility: json['eligibility'] as String,
  isUnlimitedUse: json['is_unlimited_use'] as bool,
  maxUse: (json['max_use'] as num?)?.toInt(),
  merchantDatetimeStart: json['merchant_datetime_start'] as String,
  merchantDatetimeEnd: json['merchant_datetime_end'] as String,
  productAssignments:
      (json['product_assignments'] as List<dynamic>?)
          ?.map(
            (e) => MerchantPromotionProductAssignmentParamEntity.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      const [],
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$MerchantPromotionSendParamToJson(
  MerchantPromotionSendParam instance,
) => <String, dynamic>{
  'code': ?instance.code,
  'title': instance.title,
  'is_show': instance.isShow,
  'type': instance.type,
  'datetime_start': instance.datetimeStart,
  'datetime_end': instance.datetimeEnd,
  'discount_type': instance.discountType,
  'discount': instance.discount,
  'min_purchase': instance.minPurchase,
  'max_discount': ?instance.maxDiscount,
  'eligibility': instance.eligibility,
  'is_unlimited_use': instance.isUnlimitedUse,
  'max_use': ?instance.maxUse,
  'merchant_datetime_start': instance.merchantDatetimeStart,
  'merchant_datetime_end': instance.merchantDatetimeEnd,
  'product_assignments': instance.productAssignments,
  'runtimeType': instance.$type,
};
