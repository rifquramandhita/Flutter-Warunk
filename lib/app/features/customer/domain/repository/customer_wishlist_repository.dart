import 'package:warunk/app/features/customer/domain/entity/customer_wishlist.dart';
import 'package:warunk/core/network/data_state.dart';

abstract class CustomerWishlistRepository {
  Future<DataState<dynamic>> addWishlist(CustomerWishlistAddParam param);
}
