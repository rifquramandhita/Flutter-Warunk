import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_product.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_product_variant.dart';

part 'customer_cart.freezed.dart';
part 'customer_cart.g.dart';

@freezed
sealed class CustomerCart with _$CustomerCart {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory CustomerCart.entity({
    required String id,
    required int userId,
    required String productId,
    required String productVariantId,
    required int quantity,
    String? notes,
    required int unitPrice,
    required int subtotal,
    CustomerProductEntity? product,
    CustomerProductVariantEntity? productVariant,
    String? createdAt,
    String? updatedAt,
  }) = CustomerCartEntity;

  factory CustomerCart.fromJson(Map<String, dynamic> json) =>
      _$CustomerCartFromJson(json);
}
