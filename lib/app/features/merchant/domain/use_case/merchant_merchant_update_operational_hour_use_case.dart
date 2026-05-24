import 'package:warunk/app/features/merchant/domain/entity/merchant_operational_hour.dart';
import 'package:warunk/app/features/merchant/domain/repository/merchant_merchant_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class MerchantMerchantUpdateOperationalHourUseCase {
  final MerchantMerchantRepository _repository;

  MerchantMerchantUpdateOperationalHourUseCase(this._repository);

  Future<DataState<dynamic>> call(MerchantOperationalHourUpdateParam param) {
    return _repository.updateOperationalHours(param: param);
  }
}
