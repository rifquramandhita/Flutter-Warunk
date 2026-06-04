import 'package:warunk/app/features/customer/domain/entity/customer_cart.dart';
import 'package:warunk/app/features/customer/domain/repository/customer_cart_repository.dart';
import 'package:warunk/core/network/data_state.dart';
class CustomerCartGetUseCase {
  final CustomerCartRepository _repository;

  CustomerCartGetUseCase({required CustomerCartRepository repository})
      : _repository = repository;

  Future<DataState<List<CustomerCartEntity>>> call({void params}) {
    return _repository.getCarts();
  }
}
