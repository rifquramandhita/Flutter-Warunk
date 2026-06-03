import 'package:warunk/app/features/merchant/domain/repository/merchant_product_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class MerchantProductPublishUseCase {
  final MerchantProductRepository repository;

  MerchantProductPublishUseCase({required this.repository});

  Future<DataState<bool>> call(String id) {
    return repository.publish(id);
  }
}
