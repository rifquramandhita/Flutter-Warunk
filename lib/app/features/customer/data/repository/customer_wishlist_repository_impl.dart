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
  Future<DataState<List<CustomerWishlistEntity>>> getWishlists() {
    return handleResponse(() => _apiService.getWishlists(), (json) {
      if (json is Map<String, dynamic> && json['wishlists'] is List) {
        return (json['wishlists'] as List)
            .map((e) => CustomerWishlistEntity.fromJson(e as Map<String, dynamic>))
            .toList();
      }
      return [];
    });
  }

  @override
  Future<DataState<dynamic>> addWishlist(CustomerWishlistAddParam param) {
    return handleResponse(
      () => _apiService.addWishlist(param.toJson()),
      (json) => json,
    );
  }

  @override
  Future<DataState<dynamic>> removeWishlist(String productId) {
    return handleResponse(
      () => _apiService.removeWishlist(productId),
      (json) => json,
    );
  }
}
