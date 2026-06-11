import 'package:warunk/app/features/customer/domain/entity/customer_order.dart';
import 'package:warunk/app/features/customer/domain/repository/customer_order_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class CustomerOrderCancelUseCase {
  final CustomerOrderRepository _repository;

  CustomerOrderCancelUseCase(this._repository);

  Future<DataState<String>> call({required CustomerOrderCancelParam params}) {
    return _repository.cancelOrder(params);
  }
}
