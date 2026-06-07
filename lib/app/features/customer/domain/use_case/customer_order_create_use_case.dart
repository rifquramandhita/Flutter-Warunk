import 'package:warunk/app/features/customer/domain/entity/customer_order.dart';
import 'package:warunk/app/features/customer/domain/repository/customer_order_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class CustomerOrderCreateUseCase {
  final CustomerOrderRepository _repository;

  CustomerOrderCreateUseCase(this._repository);

  Future<DataState> call({required CustomerOrderCreateParam params}) {
    return _repository.createOrder(params);
  }
}
