import 'package:warunk/app/features/merchant/domain/repository/merchant_product_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class MerchantProductDeleteUseCase {
  final MerchantProductRepository _repository;

  MerchantProductDeleteUseCase({required MerchantProductRepository repository})
    : _repository = repository;

  Future<DataState<bool>> call(String id) {
    return _repository.delete(id);
  }
}
