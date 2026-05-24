import 'package:warunk/app/features/merchant/domain/entity/merchant_shipping.dart';
import 'package:warunk/app/features/merchant/domain/repository/merchant_merchant_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class MerchantMerchantUpdateShippingUseCase {
  final MerchantMerchantRepository _repository;

  MerchantMerchantUpdateShippingUseCase({required MerchantMerchantRepository repository})
      : _repository = repository;

  Future<DataState<dynamic>> call({required MerchantShippingUpdateParam param}) {
    return _repository.updateShipping(param: param);
  }
}
