import 'package:warunk/app/features/merchant/domain/entity/merchant_promotion.dart';
import 'package:warunk/app/features/merchant/domain/repository/merchant_promotion_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class MerchantPromotionGetByIdUseCase {
  final MerchantPromotionRepository _repository;

  MerchantPromotionGetByIdUseCase(this._repository);

  Future<DataState<MerchantPromotionEntity>> call(String id) {
    return _repository.getPromotionById(id);
  }
}
