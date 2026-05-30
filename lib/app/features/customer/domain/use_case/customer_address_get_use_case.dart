import 'package:warunk/app/features/customer/domain/entity/customer_address.dart';
import 'package:warunk/app/features/customer/domain/repository/customer_address_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class CustomerAddressGetUseCase {
  final CustomerAddressRepository _repository;

  CustomerAddressGetUseCase({required CustomerAddressRepository repository})
    : _repository = repository;

  Future<DataState<List<CustomerAddress>>> call() {
    return _repository.get();
  }
}
