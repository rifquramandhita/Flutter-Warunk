import 'package:warunk/app/features/customer/data/source/customer_merchant_api_service.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_merchant.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_merchant_category.dart';
import 'package:warunk/app/features/customer/domain/repository/customer_merchant_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class CustomerMerchantRepositoryImpl implements CustomerMerchantRepository {
  final CustomerMerchantApiService _apiService;

  CustomerMerchantRepositoryImpl({required CustomerMerchantApiService apiService})
      : _apiService = apiService;

  @override
  Future<DataState<List<CustomerMerchantEntity>>> get({String? category, String? keyword}) {
    return handleResponse(() => _apiService.get(category: category, keyword: keyword), (json) {
      if (json is Map<String, dynamic> && json['merchants'] is List) {
        return (json['merchants'] as List)
            .map(
              (e) => CustomerMerchantEntity.fromJson(e as Map<String, dynamic>),
            )
            .toList();
      }
      return <CustomerMerchantEntity>[];
    });
  }

  @override
  Future<DataState<CustomerMerchantEntity>> getById(String id) {
    return handleResponse(() => _apiService.getById(id), (json) {
      if (json is Map<String, dynamic> && json['merchant'] != null) {
        return CustomerMerchantEntity.fromJson(
          json['merchant'] as Map<String, dynamic>,
        );
      }
      throw Exception('Invalid response format');
    });
  }

  @override
  Future<DataState<List<CustomerMerchantCategoryEntity>>> getCategories() {
    return handleResponse(() => _apiService.getCategories(), (json) {
      if (json is Map<String, dynamic> && json['categories'] is List) {
        return (json['categories'] as List)
            .map(
              (e) => CustomerMerchantCategoryEntity.fromJson(e as Map<String, dynamic>),
            )
            .toList();
      }
      return <CustomerMerchantCategoryEntity>[];
    });
  }

  @override
  Future<DataState<List<CustomerMerchantEntity>>> getNearby({required double latitude, required double longitude}) {
    return handleResponse(() => _apiService.getNearby(latitude: latitude, longitude: longitude), (json) {
      if (json is Map<String, dynamic> && json['merchants'] is List) {
        return (json['merchants'] as List)
            .map(
              (e) => CustomerMerchantEntity.fromJson(e as Map<String, dynamic>),
            )
            .toList();
      }
      return <CustomerMerchantEntity>[];
    });
  }
}
