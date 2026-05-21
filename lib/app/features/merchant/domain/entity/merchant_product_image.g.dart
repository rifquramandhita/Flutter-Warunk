// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_product_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantProductImageEntity _$MerchantProductImageEntityFromJson(
  Map<String, dynamic> json,
) => MerchantProductImageEntity(
  id: json['id'] as String,
  filePath: json['file_path'] as String,
  url: json['url'] as String,
  fileName: json['file_name'] as String,
  fileSize: (json['file_size'] as num).toInt(),
  mimeType: json['mime_type'] as String,
  altText: json['alt_text'] as String,
  sortOrder: (json['sort_order'] as num).toInt(),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$MerchantProductImageEntityToJson(
  MerchantProductImageEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'file_path': instance.filePath,
  'url': instance.url,
  'file_name': instance.fileName,
  'file_size': instance.fileSize,
  'mime_type': instance.mimeType,
  'alt_text': instance.altText,
  'sort_order': instance.sortOrder,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
};
