import 'package:warunk/app/features/customer/domain/entity/customer_order.dart';
import 'package:warunk/app/features/customer/domain/repository/customer_order_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class CustomerOrderReceivedUseCase {
  final CustomerOrderRepository _repository;

  CustomerOrderReceivedUseCase(this._repository);

  Future<DataState<CustomerOrderEntity>> call({required String id}) {
    return _repository.receivedOrder(id);
  }
}
