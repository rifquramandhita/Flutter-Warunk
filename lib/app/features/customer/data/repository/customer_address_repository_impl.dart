import 'package:warunk/app/features/customer/data/source/customer_address_api_service.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_address.dart';
import 'package:warunk/app/features/customer/domain/repository/customer_address_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class CustomerAddressRepositoryImpl implements CustomerAddressRepository {
  final CustomerAddressApiService _apiService;

  CustomerAddressRepositoryImpl({required CustomerAddressApiService apiService})
    : _apiService = apiService;

  @override
  Future<DataState<List<CustomerAddress>>> get() {
    return handleResponse(() => _apiService.get(), (json) {
      if (json is Map<String, dynamic> && json['addresses'] is List) {
        return (json['addresses'] as List)
            .map((e) => CustomerAddress.fromJson(e as Map<String, dynamic>))
            .toList();
      }
      return <CustomerAddress>[];
    });
  }
}
