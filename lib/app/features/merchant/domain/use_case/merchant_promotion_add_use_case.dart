import 'package:warunk/app/features/merchant/domain/entity/merchant_promotion.dart';
import 'package:warunk/app/features/merchant/domain/repository/merchant_promotion_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class MerchantPromotionAddUseCase {
  final MerchantPromotionRepository repository;

  MerchantPromotionAddUseCase({required this.repository});

  Future<DataState<List<MerchantPromotionEntity>>> call() {
    return repository.getPromotions();
  }
}
