// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_order_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerOrderItemEntity _$CustomerOrderItemEntityFromJson(
  Map<String, dynamic> json,
) => CustomerOrderItemEntity(
  id: json['id'] as String?,
  orderId: json['order_id'] as String?,
  productId: json['product_id'] as String?,
  productVariantId: json['product_variant_id'] as String?,
  price: (json['price'] as num?)?.toInt(),
  subtotal: (json['subtotal'] as num?)?.toInt(),
  total: (json['total'] as num?)?.toInt(),
  quantity: (json['quantity'] as num?)?.toInt(),
  notes: json['notes'] as String?,
  productName: json['product_name'] as String?,
  productCategory: json['product_category'] as String?,
  productBranch: json['product_branch'] as String?,
  productSku: json['product_sku'] as String?,
  productVariantLabel: json['product_variant_label'] as String?,
  product: json['product_snapshot'] == null
      ? null
      : CustomerProductEntity.fromJson(
          json['product_snapshot'] as Map<String, dynamic>,
        ),
  productVariantSnapshot: json['product_variant_snapshot'],
  review: json['review'],
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  deletedAt: json['deleted_at'] as String?,
);

Map<String, dynamic> _$CustomerOrderItemEntityToJson(
  CustomerOrderItemEntity instance,
) => <String, dynamic>{
  'id': ?instance.id,
  'order_id': ?instance.orderId,
  'product_id': ?instance.productId,
  'product_variant_id': ?instance.productVariantId,
  'price': ?instance.price,
  'subtotal': ?instance.subtotal,
  'total': ?instance.total,
  'quantity': ?instance.quantity,
  'notes': ?instance.notes,
  'product_name': ?instance.productName,
  'product_category': ?instance.productCategory,
  'product_branch': ?instance.productBranch,
  'product_sku': ?instance.productSku,
  'product_variant_label': ?instance.productVariantLabel,
  'product_snapshot': ?instance.product,
  'product_variant_snapshot': ?instance.productVariantSnapshot,
  'review': ?instance.review,
  'created_at': ?instance.createdAt,
  'updated_at': ?instance.updatedAt,
  'deleted_at': ?instance.deletedAt,
};
