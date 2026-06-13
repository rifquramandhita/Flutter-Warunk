import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_product.dart';

part 'customer_wishlist.freezed.dart';
part 'customer_wishlist.g.dart';

@freezed
sealed class CustomerWishlist with _$CustomerWishlist {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory CustomerWishlist.addParam({required String productId}) =
      CustomerWishlistAddParam;

  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory CustomerWishlist.entity({
    required String id,
    int? userId,
    String? productId,
    CustomerProductEntity? product,
    String? createdAt,
    String? updatedAt,
  }) = CustomerWishlistEntity;

  factory CustomerWishlist.fromJson(Map<String, dynamic> json) =>
      _$CustomerWishlistFromJson(json);
}
