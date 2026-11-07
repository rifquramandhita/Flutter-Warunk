import 'package:warunk/app/features/merchant/domain/entity/merchant_province.dart';
import 'package:warunk/app/features/merchant/domain/repository/merchant_region_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class MerchantRegionGetProvinceUseCase {
  final MerchantRegionRepository _repository;

  MerchantRegionGetProvinceUseCase(this._repository);

  MerchantRegionGetProvinceUseCase.named({
    required MerchantRegionRepository repository,
  }) : _repository = repository;

  Future<DataState<List<MerchantProvinceEntity>>> call() {
    return _repository.getProvinces();
  }
}

