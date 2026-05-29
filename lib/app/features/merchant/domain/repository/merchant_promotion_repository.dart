import 'package:warunk/app/features/merchant/domain/entity/merchant_promotion.dart';
import 'package:warunk/core/network/data_state.dart';

abstract class MerchantPromotionRepository {
  Future<DataState<List<MerchantPromotionEntity>>> getPromotions();
}
