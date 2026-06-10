import 'package:warunk/app/features/customer/domain/entity/customer_order.dart';
import 'package:warunk/app/features/customer/domain/repository/customer_order_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class CustomerOrderGetUseCase {
  final CustomerOrderRepository _repository;

  CustomerOrderGetUseCase(this._repository);

  Future<DataState<List<CustomerOrderEntity>>> call() {
    return _repository.getOrders();
  }
}
