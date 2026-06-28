import 'package:warunk/app/features/customer/domain/entity/customer_merchant_category.dart';
import 'package:warunk/app/features/customer/domain/repository/customer_merchant_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class CustomerMerchantGetCategoryUseCase {
  final CustomerMerchantRepository _repository;

  CustomerMerchantGetCategoryUseCase({required CustomerMerchantRepository repository})
    : _repository = repository;

  Future<DataState<List<CustomerMerchantCategoryEntity>>> call() {
    return _repository.getCategories();
  }
}
