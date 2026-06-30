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
  Future<DataState<List<CustomerProductEntity>>> getProducts({String? merchantId, String? keyword}) {
    return handleResponse(() => _apiService.getProducts(merchantId, keyword), (json) {
      if (json is Map<String, dynamic> && json['products'] is List) {
        return (json['products'] as List)
            .map((e) => CustomerProductEntity.fromJson(e as Map<String, dynamic>))
            .toList();
      }
      return [];
    });
  }

  @override
  Future<DataState<CustomerProductEntity>> getById(String productId) {
    return handleResponse(() => _apiService.getById(productId), (json) {
      if (json is Map<String, dynamic> && json['product'] != null) {
        if (json['product'] is List) {
          final list = json['product'] as List;
          if (list.isNotEmpty && list.first != null) {
            return CustomerProductEntity.fromJson(
                list.first as Map<String, dynamic>);
          }
        } else if (json['product'] is Map<String, dynamic>) {
          return CustomerProductEntity.fromJson(
              json['product'] as Map<String, dynamic>);
        }
      }
      throw const FormatException('Invalid or missing product data');
    });
  }
}
