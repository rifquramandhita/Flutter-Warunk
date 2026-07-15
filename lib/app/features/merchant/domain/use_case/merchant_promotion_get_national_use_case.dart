import 'package:warunk/app/features/merchant/domain/entity/merchant_promotion_national.dart';
import 'package:warunk/app/features/merchant/domain/repository/merchant_promotion_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class MerchantPromotionGetNationalUseCase {
  final MerchantPromotionRepository _repository;

  MerchantPromotionGetNationalUseCase(this._repository);

  Future<DataState<List<MerchantPromotionNationalEntity>>> call() {
    return _repository.getNationalPromotions();
  }
}
