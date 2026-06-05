import 'package:warunk/app/features/customer/domain/entity/customer_cart_update_param.dart';
import 'package:warunk/app/features/customer/domain/repository/customer_cart_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class CustomerCartUpdateUseCase {
  final CustomerCartRepository _repository;

  CustomerCartUpdateUseCase(this._repository);

  @override
  Future<DataState<dynamic>> call({required CustomerCartUpdateParam params}) {
    return _repository.updateCart(params);
  }
}
