import 'package:warunk/app/features/customer/domain/entity/customer_merchant.dart';
import 'package:warunk/app/features/customer/domain/repository/customer_merchant_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class CustomerMerchantGetByIdUseCase {
  final CustomerMerchantRepository _repository;

  CustomerMerchantGetByIdUseCase({
    required CustomerMerchantRepository repository,
  }) : _repository = repository;

  Future<DataState<CustomerMerchantEntity>> call(String params) {
    return _repository.getById(params);
  }
}
