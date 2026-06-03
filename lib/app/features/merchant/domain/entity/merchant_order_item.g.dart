// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_order_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantOrderItemEntity _$MerchantOrderItemEntityFromJson(
  Map<String, dynamic> json,
) => MerchantOrderItemEntity(
  id: json['id'] as String?,
  orderId: json['order_id'] as String?,
  productId: json['product_id'] as String?,
  productVariantId: json['product_variant_id'] as String?,
  quantity: (json['quantity'] as num?)?.toInt(),
  price: json['price'] as num?,
  subtotal: json['subtotal'] as num?,
  total: json['total'] as num?,
  notes: json['notes'] as String?,
  productName: json['product_name'] as String?,
  productCategory: json['product_category'] as String?,
  productBranch: json['product_branch'] as String?,
  productSku: json['product_sku'] as String?,
  productVariantLabel: json['product_variant_label'] as String?,
  productSnapshot: json['product_snapshot'] == null
      ? null
      : MerchantOrderProductSnapshotEntity.fromJson(
          json['product_snapshot'] as Map<String, dynamic>,
        ),
  productVariantSnapshot: json['product_variant_snapshot'] == null
      ? null
      : MerchantOrderProductVariantSnapshotEntity.fromJson(
          json['product_variant_snapshot'] as Map<String, dynamic>,
        ),
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$MerchantOrderItemEntityToJson(
  MerchantOrderItemEntity instance,
) => <String, dynamic>{
  'id': ?instance.id,
  'order_id': ?instance.orderId,
  'product_id': ?instance.productId,
  'product_variant_id': ?instance.productVariantId,
  'quantity': ?instance.quantity,
  'price': ?instance.price,
  'subtotal': ?instance.subtotal,
  'total': ?instance.total,
  'notes': ?instance.notes,
  'product_name': ?instance.productName,
  'product_category': ?instance.productCategory,
  'product_branch': ?instance.productBranch,
  'product_sku': ?instance.productSku,
  'product_variant_label': ?instance.productVariantLabel,
  'product_snapshot': ?instance.productSnapshot,
  'product_variant_snapshot': ?instance.productVariantSnapshot,
  'created_at': ?instance.createdAt,
  'updated_at': ?instance.updatedAt,
};

MerchantOrderProductSnapshotEntity _$MerchantOrderProductSnapshotEntityFromJson(
  Map<String, dynamic> json,
) => MerchantOrderProductSnapshotEntity(
  id: json['id'] as String?,
  sku: json['sku'] as String?,
  name: json['name'] as String?,
  slug: json['slug'] as String?,
  price: json['price'],
  width: json['width'],
  height: json['height'],
  length: json['length'],
  weight: json['weight'],
  category: json['category'] as String?,
);

Map<String, dynamic> _$MerchantOrderProductSnapshotEntityToJson(
  MerchantOrderProductSnapshotEntity instance,
) => <String, dynamic>{
  'id': ?instance.id,
  'sku': ?instance.sku,
  'name': ?instance.name,
  'slug': ?instance.slug,
  'price': ?instance.price,
  'width': ?instance.width,
  'height': ?instance.height,
  'length': ?instance.length,
  'weight': ?instance.weight,
  'category': ?instance.category,
};

MerchantOrderProductVariantSnapshotEntity
_$MerchantOrderProductVariantSnapshotEntityFromJson(
  Map<String, dynamic> json,
) => MerchantOrderProductVariantSnapshotEntity(
  id: json['id'] as String?,
  sku: json['sku'] as String?,
  variantCombination: json['variant_combination'] as Map<String, dynamic>?,
  price: json['price'],
  stock: json['stock'],
  minPurchase: json['min_purchase'],
  weight: json['weight'],
  length: json['length'],
  width: json['width'],
  height: json['height'],
);

Map<String, dynamic> _$MerchantOrderProductVariantSnapshotEntityToJson(
  MerchantOrderProductVariantSnapshotEntity instance,
) => <String, dynamic>{
  'id': ?instance.id,
  'sku': ?instance.sku,
  'variant_combination': ?instance.variantCombination,
  'price': ?instance.price,
  'stock': ?instance.stock,
  'min_purchase': ?instance.minPurchase,
  'weight': ?instance.weight,
  'length': ?instance.length,
  'width': ?instance.width,
  'height': ?instance.height,
};
