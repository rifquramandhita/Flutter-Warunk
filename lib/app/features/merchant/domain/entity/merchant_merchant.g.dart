// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_merchant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantMerchantEntity _$MerchantMerchantEntityFromJson(
  Map<String, dynamic> json,
) => MerchantMerchantEntity(
  id: json['id'] as String,
  name: json['name'] as String,
  slug: json['slug'] as String,
  userId: (json['user_id'] as num?)?.toInt(),
  merchantCategoryId: json['merchant_category_id'] as String?,
  merchantCategory: json['merchant_category'] as String?,
  status: json['status'] as String?,
  statusChangedBy: (json['status_changed_by'] as num?)?.toInt(),
  phone: json['whatsapp_number'] as String?,
  isOpenAllDay: json['is_open_all_day'] as bool?,
  isOpen24Hours: json['is_open24_hours'] as bool?,
  timeOpen: json['time_open'] as String?,
  timeClose: json['time_close'] as String?,
  internalCourier: json['internal_courier'] as bool?,
  instantCourier: json['instant_courier'] as bool?,
  pickupAtStore: json['pickup_at_store'] as bool?,
  maxDistanceInternalCourier: (json['max_distance_internal_courier'] as num?)
      ?.toInt(),
  merchantAccounts:
      (json['merchant_accounts'] as List<dynamic>?)
          ?.map(
            (e) => MerchantAccountEntity.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  address: json['address'] as String?,
  province: json['province'] as String?,
  city: json['city'] as String?,
  district: json['district'] as String?,
  postalCode: json['postal_code'] as String?,
  longitude: (json['longitude'] as num?)?.toDouble(),
  latitude: (json['latitude'] as num?)?.toDouble(),
  photo: json['photo'] as String?,
  balance: (json['balance'] as num?)?.toInt(),
  isActive: json['is_active'] as bool?,
  isOpen: json['is_open'] as bool,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$MerchantMerchantEntityToJson(
  MerchantMerchantEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'slug': instance.slug,
  'user_id': instance.userId,
  'merchant_category_id': instance.merchantCategoryId,
  'merchant_category': instance.merchantCategory,
  'status': instance.status,
  'status_changed_by': instance.statusChangedBy,
  'whatsapp_number': instance.phone,
  'is_open_all_day': instance.isOpenAllDay,
  'is_open24_hours': instance.isOpen24Hours,
  'time_open': instance.timeOpen,
  'time_close': instance.timeClose,
  'internal_courier': instance.internalCourier,
  'instant_courier': instance.instantCourier,
  'pickup_at_store': instance.pickupAtStore,
  'max_distance_internal_courier': instance.maxDistanceInternalCourier,
  'merchant_accounts': instance.merchantAccounts,
  'address': instance.address,
  'province': instance.province,
  'city': instance.city,
  'district': instance.district,
  'postal_code': instance.postalCode,
  'longitude': instance.longitude,
  'latitude': instance.latitude,
  'photo': instance.photo,
  'balance': instance.balance,
  'is_active': instance.isActive,
  'is_open': instance.isOpen,
  'runtimeType': instance.$type,
};

MerchantMerchantUpdateParam _$MerchantMerchantUpdateParamFromJson(
  Map<String, dynamic> json,
) => MerchantMerchantUpdateParam(
  name: json['name'] as String,
  slug: json['slug'] as String,
  merchantCategoryName: json['merchantCategoryName'] as String?,
  whatsappNumber: json['whatsappNumber'] as String?,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$MerchantMerchantUpdateParamToJson(
  MerchantMerchantUpdateParam instance,
) => <String, dynamic>{
  'name': instance.name,
  'slug': instance.slug,
  'merchantCategoryName': instance.merchantCategoryName,
  'whatsappNumber': instance.whatsappNumber,
  'runtimeType': instance.$type,
};
