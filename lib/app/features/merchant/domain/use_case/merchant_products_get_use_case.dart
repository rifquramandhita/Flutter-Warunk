import 'package:warunk/app/features/merchant/domain/entity/merchant_product.dart';
import 'package:warunk/app/features/merchant/domain/repository/merchant_product_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class MerchantProductsGetUseCase {
  final MerchantProductRepository repository;

  MerchantProductsGetUseCase({required this.repository});

  Future<DataState<List<MerchantProduct>>> call() {
    return repository.get();
  }
}
