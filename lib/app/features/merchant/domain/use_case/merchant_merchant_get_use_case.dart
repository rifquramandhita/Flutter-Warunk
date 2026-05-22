import 'package:warunk/app/features/merchant/domain/entity/merchant_merchant.dart';
import 'package:warunk/app/features/merchant/domain/repository/merchant_merchant_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class MerchantMerchantGetUseCase {
  final MerchantMerchantRepository _repository;

  MerchantMerchantGetUseCase({required MerchantMerchantRepository repository})
    : _repository = repository;

  Future<DataState<MerchantMerchantEntity>> call() {
    return _repository.get();
  }
}
