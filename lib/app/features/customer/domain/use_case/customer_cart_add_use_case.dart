import 'package:warunk/app/features/customer/domain/entity/customer_cart_add_param.dart';
import 'package:warunk/app/features/customer/domain/repository/customer_cart_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class CustomerCartAddUseCase {
  final CustomerCartRepository _repository;

  CustomerCartAddUseCase({required CustomerCartRepository repository})
    : _repository = repository;

  Future<DataState<dynamic>> call(CustomerCartAddParam param) {
    return _repository.addCart(param);
  }
}
