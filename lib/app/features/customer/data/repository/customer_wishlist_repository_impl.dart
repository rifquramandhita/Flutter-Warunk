import 'package:warunk/app/features/customer/data/source/customer_wishlist_api_service.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_wishlist.dart';
import 'package:warunk/app/features/customer/domain/repository/customer_wishlist_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class CustomerWishlistRepositoryImpl implements CustomerWishlistRepository {
  final CustomerWishlistApiService _apiService;

  CustomerWishlistRepositoryImpl({
    required CustomerWishlistApiService apiService,
  }) : _apiService = apiService;

  @override
  Future<DataState<dynamic>> addWishlist(CustomerWishlistAddParam param) {
    return handleResponse(
      () => _apiService.addWishlist(param.toJson()),
      (json) => json,
    );
  }
}
