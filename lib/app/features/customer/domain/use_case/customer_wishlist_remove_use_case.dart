import 'package:warunk/app/features/customer/domain/repository/customer_wishlist_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class CustomerWishlistRemoveUseCase {
  final CustomerWishlistRepository _repository;

  CustomerWishlistRemoveUseCase({required CustomerWishlistRepository repository})
    : _repository = repository;

  Future<DataState<dynamic>> call(String productId) {
    return _repository.removeWishlist(productId);
  }
}
