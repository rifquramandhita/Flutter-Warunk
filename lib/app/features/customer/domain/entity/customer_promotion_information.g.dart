// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_promotion_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerPromotionInformationEntity _$CustomerPromotionInformationEntityFromJson(
  Map<String, dynamic> json,
) => CustomerPromotionInformationEntity(
  id: json['id'] as String?,
  type: json['type'] as String?,
  eyebrow: json['eyebrow'] as String?,
  title: json['title'] as String?,
  description: json['description'] as String?,
  image: json['image'] as String?,
  badge: json['badge'] as String?,
  href: json['href'] as String?,
  detailUrl: json['detail_url'] as String?,
  buttonLabel: json['button_label'] as String?,
  sortOrder: (json['sort_order'] as num?)?.toInt(),
  startsAt: json['starts_at'] as String?,
  endsAt: json['ends_at'] as String?,
);

Map<String, dynamic> _$CustomerPromotionInformationEntityToJson(
  CustomerPromotionInformationEntity instance,
) => <String, dynamic>{
  'id': ?instance.id,
  'type': ?instance.type,
  'eyebrow': ?instance.eyebrow,
  'title': ?instance.title,
  'description': ?instance.description,
  'image': ?instance.image,
  'badge': ?instance.badge,
  'href': ?instance.href,
  'detail_url': ?instance.detailUrl,
  'button_label': ?instance.buttonLabel,
  'sort_order': ?instance.sortOrder,
  'starts_at': ?instance.startsAt,
  'ends_at': ?instance.endsAt,
};
