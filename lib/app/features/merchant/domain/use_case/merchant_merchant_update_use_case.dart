import 'package:warunk/app/features/merchant/domain/entity/merchant_merchant.dart';
import 'package:warunk/app/features/merchant/domain/repository/merchant_merchant_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class MerchantMerchantUpdateUseCase {
  final MerchantMerchantRepository _repository;

  MerchantMerchantUpdateUseCase({required MerchantMerchantRepository repository})
      : _repository = repository;

  Future<DataState<dynamic>> call(
      {required MerchantMerchantUpdateParam param}) {
    return _repository.update(param: param);
  }
}
