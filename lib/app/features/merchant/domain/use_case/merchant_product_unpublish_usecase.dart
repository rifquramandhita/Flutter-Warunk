import 'package:warunk/app/features/merchant/domain/repository/merchant_product_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class MerchantProductUnpublishUseCase {
  final MerchantProductRepository repository;

  MerchantProductUnpublishUseCase({required this.repository});

  Future<DataState<bool>> call(String id) {
    return repository.unpublish(id);
  }
}
