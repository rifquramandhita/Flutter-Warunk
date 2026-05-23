import 'package:warunk/app/features/merchant/domain/repository/merchant_merchant_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class MerchantMerchantOpenUseCase {
  final MerchantMerchantRepository _repository;

  MerchantMerchantOpenUseCase(this._repository);

  Future<DataState<dynamic>> call() {
    return _repository.open();
  }
}
