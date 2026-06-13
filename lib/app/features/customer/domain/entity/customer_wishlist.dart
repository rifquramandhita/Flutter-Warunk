import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_wishlist.freezed.dart';
part 'customer_wishlist.g.dart';

@freezed
sealed class CustomerWishlist with _$CustomerWishlist {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory CustomerWishlist.addParam({required String productId}) =
      CustomerWishlistAddParam;

  factory CustomerWishlist.fromJson(Map<String, dynamic> json) =>
      _$CustomerWishlistFromJson(json);
}
