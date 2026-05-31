import 'package:warunk/app/features/customer/domain/entity/customer_address.dart';
import 'package:warunk/app/features/customer/domain/repository/customer_address_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class CustomerAddressSendUseCase {
  final CustomerAddressRepository _repository;

  CustomerAddressSendUseCase({required CustomerAddressRepository repository})
      : _repository = repository;

  Future<DataState<dynamic>> call({required CustomerAddressSendParam param}) {
    if (param.id != null) {
      return _repository.update(param: param);
    } else {
      return _repository.insert(param: param);
    }
  }
}
