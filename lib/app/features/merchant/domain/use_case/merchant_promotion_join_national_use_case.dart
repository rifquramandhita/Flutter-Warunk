import 'package:warunk/app/features/merchant/domain/repository/merchant_promotion_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class MerchantPromotionJoinNationalUseCase {
  final MerchantPromotionRepository _repository;

  MerchantPromotionJoinNationalUseCase(this._repository);

  Future<DataState<bool>> call(String id) {
    return _repository.joinNationalPromotion(id);
  }
}
