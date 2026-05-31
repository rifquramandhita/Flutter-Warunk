import 'package:warunk/app/features/customer/domain/entity/customer_merchant.dart';
import 'package:warunk/app/features/customer/domain/repository/customer_merchant_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class CustomerMerchantGetUseCase {
  final CustomerMerchantRepository _repository;

  CustomerMerchantGetUseCase({required CustomerMerchantRepository repository})
    : _repository = repository;

  @override
  Future<DataState<List<CustomerMerchantEntity>>> call({void params}) {
    return _repository.get();
  }
}
