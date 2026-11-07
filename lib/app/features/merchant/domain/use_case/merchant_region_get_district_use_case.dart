import 'package:warunk/app/features/merchant/domain/entity/merchant_district.dart';
import 'package:warunk/app/features/merchant/domain/repository/merchant_region_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class MerchantRegionGetDistrictUseCase {
  final MerchantRegionRepository _repository;

  MerchantRegionGetDistrictUseCase(this._repository);

  MerchantRegionGetDistrictUseCase.named({
    required MerchantRegionRepository repository,
  }) : _repository = repository;

  Future<DataState<List<MerchantDistrictEntity>>> call(dynamic regencyId) {
    return _repository.getDistricts(regencyId.toString());
  }

  Future<DataState<List<MerchantDistrictEntity>>> byId({
    required dynamic regencyId,
  }) {
    return call(regencyId);
  }
}

