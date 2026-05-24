import 'package:warunk/app/features/merchant/domain/repository/merchant_merchant_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class MerchantMerchantGetCourierUseCase {
  final MerchantMerchantRepository _repository;

  MerchantMerchantGetCourierUseCase({required MerchantMerchantRepository repository})
      : _repository = repository;

  Future<DataState<List<String>>> call() {
    return _repository.getCourier();
  }
}
