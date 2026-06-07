import 'package:warunk/app/features/customer/domain/entity/customer_checkout.dart';
import 'package:warunk/app/features/customer/domain/repository/customer_order_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class CustomerCheckoutGetOptionUseCase {
  final CustomerOrderRepository _repository;

  CustomerCheckoutGetOptionUseCase({
    required CustomerOrderRepository repository,
  }) : _repository = repository;

  Future<DataState<CustomerCheckoutOptionEntity>> call(
    CustomerCheckoutSendParam param,
  ) {
    return _repository.getCheckoutOptions(param);
  }
}
