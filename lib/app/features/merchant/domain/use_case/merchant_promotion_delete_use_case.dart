import 'package:warunk/app/features/merchant/domain/repository/merchant_promotion_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class MerchantPromotionDeleteUseCase {
  final MerchantPromotionRepository _repository;

  MerchantPromotionDeleteUseCase(this._repository);

  Future<DataState> call(String id) {
    return _repository.deletePromotion(id);
  }
}
