import 'package:warunk/app/features/customer/data/source/customer_product_api_service.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_product.dart';
import 'package:warunk/app/features/customer/domain/repository/customer_product_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class CustomerProductRepositoryImpl implements CustomerProductRepository {
  final CustomerProductApiService _apiService;

  CustomerProductRepositoryImpl({
    required CustomerProductApiService apiService,
  }) : _apiService = apiService;

  @override
  Future<DataState<List<CustomerProductEntity>>> getByMerchant(String merchantId) {
    return handleResponse(() => _apiService.getByMerchant(merchantId), (json) {
      if (json is Map<String, dynamic> && json['products'] is List) {
        return (json['products'] as List)
            .map((e) => CustomerProductEntity.fromJson(e as Map<String, dynamic>))
            .toList();
      }
      return [];
    });
  }
}
