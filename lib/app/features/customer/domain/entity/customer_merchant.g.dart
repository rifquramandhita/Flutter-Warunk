// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_merchant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerMerchantEntity _$CustomerMerchantEntityFromJson(
  Map<String, dynamic> json,
) => CustomerMerchantEntity(
  id: json['id'] as String,
  name: json['name'] as String,
  slug: json['slug'] as String,
  photo: json['photo'] as String?,
  isActive: json['is_active'] as bool,
  isOpen: json['is_open'] as bool,
  userId: (json['user_id'] as num?)?.toInt(),
  merchantCategory: json['merchant_category'] as String?,
  status: json['status'] as String?,
  statusChangedBy: (json['status_changed_by'] as num?)?.toInt(),
  whatsappNumber: json['whatsapp_number'] as String?,
  isOpenAllDay: json['is_open_all_day'] as bool?,
  isOpen24Hours: json['is_open_24_hours'] as bool?,
  timeOpen: json['time_open'] as String?,
  timeClose: json['time_close'] as String?,
  internalCourier: json['internal_courier'] as bool?,
  instantCourier: json['instant_courier'] as bool?,
  pickupAtStore: json['pickup_at_store'] as bool?,
  courierCodeAvailable: (json['courier_code_available'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  maxDistanceInternalCourier: (json['max_distance_internal_courier'] as num?)
      ?.toInt(),
  merchantAccounts: (json['merchant_accounts'] as List<dynamic>?)
      ?.map(
        (e) =>
            CustomerMerchantAccountEntity.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  merchantOpens: (json['merchant_opens'] as List<dynamic>?)
      ?.map(
        (e) => CustomerMerchantOpenEntity.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  address: json['address'] as String?,
  province: json['province'] as String?,
  city: json['city'] as String?,
  district: json['district'] as String?,
  postalCode: json['postal_code'] as String?,
  longitude: (json['longitude'] as num?)?.toDouble(),
  latitude: (json['latitude'] as num?)?.toDouble(),
  balance: (json['balance'] as num?)?.toInt(),
  currentBalance: (json['current_balance'] as num?)?.toInt(),
  distance: (json['distance'] as num?)?.toDouble(),
  promoBadges: (json['promo_badges'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  user: json['user'] == null
      ? null
      : CustomerMerchantUserEntity.fromJson(
          json['user'] as Map<String, dynamic>,
        ),
  chatUrl: json['chat_url'] as String?,
  about: json['about'] as String?,
  internalCourierShippingCost: (json['internal_courier_shipping_cost'] as num?)
      ?.toInt(),
  aboutSections: (json['about_sections'] as List<dynamic>?)
      ?.map(
        (e) => CustomerMerchantAboutSectionEntity.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList(),
  reviewSummary: json['review_summary'] == null
      ? null
      : CustomerMerchantReviewSummaryEntity.fromJson(
          json['review_summary'] as Map<String, dynamic>,
        ),
  reviewBreakdown: (json['review_breakdown'] as List<dynamic>?)
      ?.map(
        (e) => CustomerMerchantReviewBreakdownEntity.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList(),
  reviews: json['reviews'] as List<dynamic>?,
  reviewEmptyMessage: json['review_empty_message'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$CustomerMerchantEntityToJson(
  CustomerMerchantEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'slug': instance.slug,
  'photo': ?instance.photo,
  'is_active': instance.isActive,
  'is_open': instance.isOpen,
  'user_id': ?instance.userId,
  'merchant_category': ?instance.merchantCategory,
  'status': ?instance.status,
  'status_changed_by': ?instance.statusChangedBy,
  'whatsapp_number': ?instance.whatsappNumber,
  'is_open_all_day': ?instance.isOpenAllDay,
  'is_open_24_hours': ?instance.isOpen24Hours,
  'time_open': ?instance.timeOpen,
  'time_close': ?instance.timeClose,
  'internal_courier': ?instance.internalCourier,
  'instant_courier': ?instance.instantCourier,
  'pickup_at_store': ?instance.pickupAtStore,
  'courier_code_available': ?instance.courierCodeAvailable,
  'max_distance_internal_courier': ?instance.maxDistanceInternalCourier,
  'merchant_accounts': ?instance.merchantAccounts,
  'merchant_opens': ?instance.merchantOpens,
  'address': ?instance.address,
  'province': ?instance.province,
  'city': ?instance.city,
  'district': ?instance.district,
  'postal_code': ?instance.postalCode,
  'longitude': ?instance.longitude,
  'latitude': ?instance.latitude,
  'balance': ?instance.balance,
  'current_balance': ?instance.currentBalance,
  'distance': ?instance.distance,
  'promo_badges': ?instance.promoBadges,
  'user': ?instance.user,
  'chat_url': ?instance.chatUrl,
  'about': ?instance.about,
  'internal_courier_shipping_cost': ?instance.internalCourierShippingCost,
  'about_sections': ?instance.aboutSections,
  'review_summary': ?instance.reviewSummary,
  'review_breakdown': ?instance.reviewBreakdown,
  'reviews': ?instance.reviews,
  'review_empty_message': ?instance.reviewEmptyMessage,
  'created_at': ?instance.createdAt?.toIso8601String(),
  'updated_at': ?instance.updatedAt?.toIso8601String(),
};

CustomerMerchantAccountEntity _$CustomerMerchantAccountEntityFromJson(
  Map<String, dynamic> json,
) => CustomerMerchantAccountEntity(
  id: json['id'] as String,
  bankName: json['bank_name'] as String,
  accountName: json['account_name'] as String,
  accountNumber: json['account_number'] as String,
);

Map<String, dynamic> _$CustomerMerchantAccountEntityToJson(
  CustomerMerchantAccountEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'bank_name': instance.bankName,
  'account_name': instance.accountName,
  'account_number': instance.accountNumber,
};

CustomerMerchantOpenEntity _$CustomerMerchantOpenEntityFromJson(
  Map<String, dynamic> json,
) => CustomerMerchantOpenEntity(
  id: json['id'] as String,
  day: json['day'] as String,
  isClosed: json['is_closed'] as bool,
  isOpen24Hours: json['is_open_24_hours'] as bool,
  timeOpen: json['time_open'] as String?,
  timeClose: json['time_close'] as String?,
);

Map<String, dynamic> _$CustomerMerchantOpenEntityToJson(
  CustomerMerchantOpenEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'day': instance.day,
  'is_closed': instance.isClosed,
  'is_open_24_hours': instance.isOpen24Hours,
  'time_open': ?instance.timeOpen,
  'time_close': ?instance.timeClose,
};

CustomerMerchantUserEntity _$CustomerMerchantUserEntityFromJson(
  Map<String, dynamic> json,
) => CustomerMerchantUserEntity(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  email: json['email'] as String,
  phone: json['phone'] as String,
  profilePhoto: json['profile_photo'] as String?,
);

Map<String, dynamic> _$CustomerMerchantUserEntityToJson(
  CustomerMerchantUserEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'phone': instance.phone,
  'profile_photo': ?instance.profilePhoto,
};

CustomerMerchantAboutSectionEntity _$CustomerMerchantAboutSectionEntityFromJson(
  Map<String, dynamic> json,
) => CustomerMerchantAboutSectionEntity(
  title: json['title'] as String,
  content: json['content'] as String,
);

Map<String, dynamic> _$CustomerMerchantAboutSectionEntityToJson(
  CustomerMerchantAboutSectionEntity instance,
) => <String, dynamic>{'title': instance.title, 'content': instance.content};

CustomerMerchantReviewSummaryEntity
_$CustomerMerchantReviewSummaryEntityFromJson(Map<String, dynamic> json) =>
    CustomerMerchantReviewSummaryEntity(
      rating: json['rating'] as String,
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$CustomerMerchantReviewSummaryEntityToJson(
  CustomerMerchantReviewSummaryEntity instance,
) => <String, dynamic>{'rating': instance.rating, 'total': instance.total};

CustomerMerchantReviewBreakdownEntity
_$CustomerMerchantReviewBreakdownEntityFromJson(Map<String, dynamic> json) =>
    CustomerMerchantReviewBreakdownEntity(
      label: json['label'] as String,
      percent: (json['percent'] as num).toInt(),
    );

Map<String, dynamic> _$CustomerMerchantReviewBreakdownEntityToJson(
  CustomerMerchantReviewBreakdownEntity instance,
) => <String, dynamic>{'label': instance.label, 'percent': instance.percent};
