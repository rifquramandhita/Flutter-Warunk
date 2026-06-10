import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_product.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_product_variant.dart';

part 'customer_order_item.g.dart';
part 'customer_order_item.freezed.dart';

@freezed
sealed class CustomerOrderItem with _$CustomerOrderItem {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory CustomerOrderItem.entity({
    String? id,
    String? orderId,
    String? productId,
    String? productVariantId,
    int? price,
    int? subtotal,
    int? total,
    int? quantity,
    String? notes,
    String? productName,
    String? productCategory,
    String? productBranch,
    String? productSku,
    String? productVariantLabel,
    @JsonKey(name: 'product_snapshot') CustomerProductEntity? product,
    @JsonKey(name: 'product_variant_snapshot') dynamic productVariantSnapshot,
    dynamic review,
    String? createdAt,
    String? updatedAt,
    String? deletedAt,
  }) = CustomerOrderItemEntity;

  factory CustomerOrderItem.fromJson(Map<String, dynamic> json) =>
      _$CustomerOrderItemFromJson(json);
}
