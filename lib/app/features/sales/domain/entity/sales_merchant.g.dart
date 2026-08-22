// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_merchant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SalesMerchantEntity _$SalesMerchantEntityFromJson(Map<String, dynamic> json) =>
    _SalesMerchantEntity(
      id: json['id'] as String,
      name: json['name'] as String,
      slug: json['slug'] as String,
      whatsappNumber: json['whatsapp_number'] as String?,
      address: json['address'] as String,
      districtId: (json['district_id'] as num).toInt(),
      province: json['province'] as String,
      city: json['city'] as String,
      district: json['district'] as String,
      photo: json['photo'] as String?,
      salesId: (json['sales_id'] as num?)?.toInt(),
      salesName: json['sales_name'] as String?,
      isClaimed: json['is_claimed'] as bool,
      isClaimedByMe: json['is_claimed_by_me'] as bool,
      canLoginAsMerchant: json['can_login_as_merchant'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$SalesMerchantEntityToJson(
  _SalesMerchantEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'slug': instance.slug,
  'whatsapp_number': instance.whatsappNumber,
  'address': instance.address,
  'district_id': instance.districtId,
  'province': instance.province,
  'city': instance.city,
  'district': instance.district,
  'photo': instance.photo,
  'sales_id': instance.salesId,
  'sales_name': instance.salesName,
  'is_claimed': instance.isClaimed,
  'is_claimed_by_me': instance.isClaimedByMe,
  'can_login_as_merchant': instance.canLoginAsMerchant,
  'created_at': instance.createdAt.toIso8601String(),
};

_SalesMerchantResponseEntity _$SalesMerchantResponseEntityFromJson(
  Map<String, dynamic> json,
) => _SalesMerchantResponseEntity(
  merchants:
      (json['merchants'] as List<dynamic>?)
          ?.map((e) => SalesMerchantEntity.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  pagination: json['pagination'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$SalesMerchantResponseEntityToJson(
  _SalesMerchantResponseEntity instance,
) => <String, dynamic>{
  'merchants': instance.merchants,
  'pagination': instance.pagination,
};
