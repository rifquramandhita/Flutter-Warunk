import 'package:warunk/app/features/customer/domain/entity/customer_order.dart';
import 'package:warunk/app/features/customer/domain/repository/customer_order_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class CustomerOrderCompleteUseCase {
  final CustomerOrderRepository _repository;

  CustomerOrderCompleteUseCase(this._repository);

  Future<DataState<CustomerOrderEntity>> call({
    required CustomerOrderCompleteParam params,
  }) {
    return _repository.completeOrder(params);
  }
}
