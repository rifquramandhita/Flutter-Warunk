import 'package:warunk/core/network/data_state.dart';
import 'package:warunk/app/features/merchant/domain/repository/merchant_location_repository.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_location_position.dart';

class MerchantLocationGetCurrentUseCase {
  final MerchantLocationRepository _repository;

  MerchantLocationGetCurrentUseCase(this._repository);

  Future<DataState<MerchantLocationPositionEntity>> call() {
    return _repository.getCurrentPosition();
  }
}
