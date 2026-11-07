import 'package:warunk/app/features/merchant/domain/entity/merchant_regency.dart';
import 'package:warunk/app/features/merchant/domain/repository/merchant_region_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class MerchantRegionGetRegencyUseCase {
  final MerchantRegionRepository _repository;

  MerchantRegionGetRegencyUseCase(this._repository);

  MerchantRegionGetRegencyUseCase.named({
    required MerchantRegionRepository repository,
  }) : _repository = repository;

  Future<DataState<List<MerchantRegencyEntity>>> call(dynamic provinceId) {
    return _repository.getRegencies(provinceId.toString());
  }

  Future<DataState<List<MerchantRegencyEntity>>> byId({
    required dynamic provinceId,
  }) {
    return call(provinceId);
  }
}

