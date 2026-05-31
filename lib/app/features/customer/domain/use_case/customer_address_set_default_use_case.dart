import 'package:warunk/app/features/customer/domain/repository/customer_address_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class CustomerAddressSetDefaultUseCase {
  final CustomerAddressRepository _repository;

  CustomerAddressSetDefaultUseCase(
      {required CustomerAddressRepository repository})
      : _repository = repository;

  Future<DataState<dynamic>> call(String id) {
    return _repository.setAsDefault(id);
  }
}
