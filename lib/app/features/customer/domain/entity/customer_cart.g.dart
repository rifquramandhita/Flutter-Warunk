// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerCartEntity _$CustomerCartEntityFromJson(Map<String, dynamic> json) =>
    CustomerCartEntity(
      id: json['id'] as String,
      userId: (json['user_id'] as num).toInt(),
      productId: json['product_id'] as String,
      productVariantId: json['product_variant_id'] as String?,
      quantity: (json['quantity'] as num).toInt(),
      notes: json['notes'] as String?,
      unitPrice: (json['unit_price'] as num).toInt(),
      subtotal: (json['subtotal'] as num).toInt(),
      product: json['product'] == null
          ? null
          : CustomerProductEntity.fromJson(
              json['product'] as Map<String, dynamic>,
            ),
      productVariant: json['product_variant'] == null
          ? null
          : CustomerProductVariantEntity.fromJson(
              json['product_variant'] as Map<String, dynamic>,
            ),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$CustomerCartEntityToJson(CustomerCartEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'product_id': instance.productId,
      'product_variant_id': ?instance.productVariantId,
      'quantity': instance.quantity,
      'notes': ?instance.notes,
      'unit_price': instance.unitPrice,
      'subtotal': instance.subtotal,
      'product': ?instance.product,
      'product_variant': ?instance.productVariant,
      'created_at': ?instance.createdAt,
      'updated_at': ?instance.updatedAt,
    };
