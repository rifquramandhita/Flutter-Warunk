import 'package:warunk/app/features/customer/data/source/customer_cart_api_service.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_cart_add_param.dart';
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
}
