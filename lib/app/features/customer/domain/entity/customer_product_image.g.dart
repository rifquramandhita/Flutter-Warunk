// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_product_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerProductImageEntity _$CustomerProductImageEntityFromJson(
  Map<String, dynamic> json,
) => CustomerProductImageEntity(
  id: json['id'] as String,
  filePath: json['file_path'] as String,
  url: json['url'] as String,
  fileName: json['file_name'] as String,
  fileSize: (json['file_size'] as num).toInt(),
  mimeType: json['mime_type'] as String,
  altText: json['alt_text'] as String,
  sortOrder: (json['sort_order'] as num).toInt(),
);

Map<String, dynamic> _$CustomerProductImageEntityToJson(
  CustomerProductImageEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'file_path': instance.filePath,
  'url': instance.url,
  'file_name': instance.fileName,
  'file_size': instance.fileSize,
  'mime_type': instance.mimeType,
  'alt_text': instance.altText,
  'sort_order': instance.sortOrder,
};
