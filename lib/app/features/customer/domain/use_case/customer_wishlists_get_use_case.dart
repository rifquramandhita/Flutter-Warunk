import 'package:warunk/app/features/customer/domain/entity/customer_wishlist.dart';
import 'package:warunk/app/features/customer/domain/repository/customer_wishlist_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class CustomerWishlistsGetUseCase {
  final CustomerWishlistRepository _repository;

  CustomerWishlistsGetUseCase({
    required CustomerWishlistRepository repository,
  }) : _repository = repository;

  Future<DataState<List<CustomerWishlistEntity>>> call({void params}) async {
    return await _repository.getWishlists();
  }
}
