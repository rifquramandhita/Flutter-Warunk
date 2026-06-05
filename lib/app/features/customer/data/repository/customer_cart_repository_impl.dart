import 'package:warunk/app/features/customer/data/source/customer_cart_api_service.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_cart_add_param.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_cart_update_param.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_cart.dart';
import 'package:warunk/app/features/customer/domain/repository/customer_cart_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class CustomerCartRepositoryImpl implements CustomerCartRepository {
  final CustomerCartApiService _apiService;

  CustomerCartRepositoryImpl({
    required CustomerCartApiService apiService,
  }) : _apiService = apiService;

  @override
  Future<DataState<dynamic>> addCart(CustomerCartAddParam param) {
    return handleResponse(
      () => _apiService.addCart(param.toJson()),
      (json) => json,
    );
  }

  @override
  Future<DataState<dynamic>> deleteCart(String cartId) {
    return handleResponse(
      () => _apiService.deleteCart(cartId),
      (json) => json,
    );
  }

  @override
  Future<DataState<dynamic>> updateCart(CustomerCartUpdateParam param) {
    return handleResponse(
      () => _apiService.updateCart(param.cartId, param.toJson()),
      (json) => json,
    );
  }

  @override
  Future<DataState<List<CustomerCartEntity>>> getCarts() {
    return handleResponse(
      () => _apiService.getCarts(),
      (json) {
        if (json is Map<String, dynamic> && json['carts'] is List) {
          return (json['carts'] as List)
              .map(
                (e) => CustomerCartEntity.fromJson(e as Map<String, dynamic>),
              )
              .toList();
        }
        return <CustomerCartEntity>[];
      },
    );
  }
}
