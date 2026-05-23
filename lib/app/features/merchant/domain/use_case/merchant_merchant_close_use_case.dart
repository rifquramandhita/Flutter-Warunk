import 'package:warunk/app/features/merchant/domain/repository/merchant_merchant_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class MerchantMerchantCloseUseCase {
  final MerchantMerchantRepository _repository;

  MerchantMerchantCloseUseCase(this._repository);

  Future<DataState<dynamic>> call() {
    return _repository.close();
  }
}
