import 'package:warunk/app/features/customer/domain/entity/customer_product.dart';
import 'package:warunk/app/features/customer/domain/repository/customer_product_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class CustomerProductGetByIdUseCase {
  final CustomerProductRepository _repository;

  CustomerProductGetByIdUseCase({required CustomerProductRepository repository})
      : _repository = repository;

  Future<DataState<CustomerProductEntity>> call(String productId) {
    return _repository.getById(productId);
  }
}
