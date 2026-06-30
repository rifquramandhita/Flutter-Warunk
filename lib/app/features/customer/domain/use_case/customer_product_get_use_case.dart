import 'package:warunk/app/features/customer/domain/entity/customer_product.dart';
import 'package:warunk/app/features/customer/domain/repository/customer_product_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class CustomerProductGetUseCase {
  final CustomerProductRepository _repository;

  CustomerProductGetUseCase({
    required CustomerProductRepository repository,
  }) : _repository = repository;

  Future<DataState<List<CustomerProductEntity>>> call({String? merchantId, String? keyword}) {
    return _repository.getProducts(merchantId: merchantId, keyword: keyword);
  }
}
