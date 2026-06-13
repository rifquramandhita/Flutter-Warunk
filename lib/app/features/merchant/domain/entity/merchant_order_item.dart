import 'package:freezed_annotation/freezed_annotation.dart';

part 'merchant_order_item.freezed.dart';
part 'merchant_order_item.g.dart';

@freezed
sealed class MerchantOrderItem with _$MerchantOrderItem {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory MerchantOrderItem.entity({
    String? id,
    String? orderId,
    String? productId,
    String? productVariantId,
    int? quantity,
    int? price,
    int? subtotal,
    int? total,
    String? notes,
    String? productName,
    String? productCategory,
    String? productBranch,
    String? productSku,
    String? productVariantLabel,
    MerchantOrderProductSnapshotEntity? productSnapshot,
    MerchantOrderProductVariantSnapshotEntity? productVariantSnapshot,
    String? createdAt,
    String? updatedAt,
  }) = MerchantOrderItemEntity;

  factory MerchantOrderItem.fromJson(Map<String, dynamic> json) =>
      _$MerchantOrderItemFromJson(json);
}

@freezed
sealed class MerchantOrderProductSnapshot with _$MerchantOrderProductSnapshot {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory MerchantOrderProductSnapshot.entity({
    String? id,
    String? sku,
    String? name,
    String? slug,
    int? price,
    int? width,
    int? height,
    int? length,
    int? weight,
    String? category,
  }) = MerchantOrderProductSnapshotEntity;

  factory MerchantOrderProductSnapshot.fromJson(Map<String, dynamic> json) =>
      _$MerchantOrderProductSnapshotFromJson(json);
}

@freezed
sealed class MerchantOrderProductVariantSnapshot
    with _$MerchantOrderProductVariantSnapshot {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory MerchantOrderProductVariantSnapshot.entity({
    String? id,
    String? sku,
    Map<String, dynamic>? variantCombination,
    dynamic price,
    dynamic stock,
    dynamic minPurchase,
    dynamic weight,
    dynamic length,
    dynamic width,
    dynamic height,
  }) = MerchantOrderProductVariantSnapshotEntity;

  factory MerchantOrderProductVariantSnapshot.fromJson(
    Map<String, dynamic> json,
  ) => _$MerchantOrderProductVariantSnapshotFromJson(json);
}
