import 'package:warunk/app/features/customer/domain/entity/customer_merchant_quick_category.dart';
import 'package:warunk/app/features/customer/domain/repository/customer_merchant_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class CustomerMerchantGetQuickCategoryUseCase {
  final CustomerMerchantRepository _repository;

  CustomerMerchantGetQuickCategoryUseCase({required CustomerMerchantRepository repository})
      : _repository = repository;

  Future<DataState<List<CustomerMerchantQuickCategoryEntity>>> call() {
    return _repository.getQuickCategories();
  }
}
