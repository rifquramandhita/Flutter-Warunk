import 'package:warunk/app/features/customer/domain/entity/customer_wishlist.dart';
import 'package:warunk/app/features/customer/domain/repository/customer_wishlist_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class CustomerWishlistAddUseCase {
  final CustomerWishlistRepository _repository;

  CustomerWishlistAddUseCase({required CustomerWishlistRepository repository})
    : _repository = repository;

  Future<DataState<dynamic>> call(CustomerWishlistAddParam param) {
    return _repository.addWishlist(param);
  }
}
