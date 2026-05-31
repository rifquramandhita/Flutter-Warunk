import 'package:warunk/app/features/customer/domain/entity/customer_address.dart';
import 'package:warunk/app/features/customer/domain/repository/customer_address_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class CustomerAddressGetByIdUseCase {
  final CustomerAddressRepository _repository;

  CustomerAddressGetByIdUseCase({required CustomerAddressRepository repository})
      : _repository = repository;

  Future<DataState<CustomerAddressEntity>> call(String id) {
    return _repository.getById(id);
  }
}
