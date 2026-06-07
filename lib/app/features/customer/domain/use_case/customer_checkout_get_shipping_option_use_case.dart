import 'package:warunk/app/features/customer/domain/entity/customer_checkout.dart';
import 'package:warunk/app/features/customer/domain/repository/customer_order_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class CustomerCheckoutGetShippingOptionUseCase {
  final CustomerOrderRepository _repository;

  CustomerCheckoutGetShippingOptionUseCase({
    required CustomerOrderRepository repository,
  }) : _repository = repository;

  Future<DataState<CustomerCheckoutOptionEntity>> call(
    CustomerCheckoutGetShippingOptionParam param,
  ) {
    return _repository.getCheckoutShippingOption(param);
  }
}
