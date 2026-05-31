import 'package:warunk/app/features/customer/data/source/customer_address_api_service.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_address.dart';
import 'package:warunk/app/features/customer/domain/repository/customer_address_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class CustomerAddressRepositoryImpl implements CustomerAddressRepository {
  final CustomerAddressApiService _apiService;

  CustomerAddressRepositoryImpl({required CustomerAddressApiService apiService})
    : _apiService = apiService;

  @override
  Future<DataState<List<CustomerAddressEntity>>> get() {
    return handleResponse(() => _apiService.get(), (json) {
      if (json is Map<String, dynamic> && json['addresses'] is List) {
        return (json['addresses'] as List)
            .map(
              (e) => CustomerAddressEntity.fromJson(e as Map<String, dynamic>),
            )
            .toList();
      }
      return <CustomerAddressEntity>[];
    });
  }

  @override
  Future<DataState<dynamic>> insert({required CustomerAddressSendParam param}) {
    return handleResponse(
      () => _apiService.create(param.toJson()),
      (json) => json,
    );
  }

  @override
  Future<DataState<dynamic>> update({required CustomerAddressSendParam param}) {
    return handleResponse(
      () => _apiService.update(param.id!, param.toJson()),
      (json) => json,
    );
  }

  @override
  Future<DataState<CustomerAddressEntity>> getById(String id) {
    return handleResponse(
      () => _apiService.getById(id),
      (json) {
        if (json is Map<String, dynamic> && json['address'] != null) {
          return CustomerAddressEntity.fromJson(
            json['address'] as Map<String, dynamic>,
          );
        }
        throw Exception('Invalid response format');
      },
    );
  }
}
