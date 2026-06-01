import 'package:warunk/app/features/customer/domain/entity/customer_product.dart';
import 'package:warunk/app/features/customer/domain/repository/customer_product_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class CustomerProductGetByMerchantUseCase {
  final CustomerProductRepository _repository;

  CustomerProductGetByMerchantUseCase({
    required CustomerProductRepository repository,
  }) : _repository = repository;

  Future<DataState<List<CustomerProductEntity>>> call(String merchantId) {
    return _repository.getByMerchant(merchantId);
  }
}
