import 'package:warunk/app/features/merchant/domain/entity/merchant_product.dart';
import 'package:warunk/app/features/merchant/domain/repository/merchant_product_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class MerchantProductSendUseCase {
  final MerchantProductRepository repository;

  MerchantProductSendUseCase({required this.repository});

  Future<DataState<MerchantProduct>> call(MerchantProductSendParam param) {
    return repository.send(param);
  }
}
