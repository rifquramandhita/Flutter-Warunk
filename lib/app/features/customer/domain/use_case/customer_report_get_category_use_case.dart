import 'package:warunk/app/features/customer/domain/repository/customer_merchant_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class CustomerReportGetCategoryUseCase {
  final CustomerMerchantRepository _repository;

  CustomerReportGetCategoryUseCase({required CustomerMerchantRepository repository})
    : _repository = repository;

  Future<DataState<List<String>>> call() {
    return _repository.getReportCategories();
  }
}
