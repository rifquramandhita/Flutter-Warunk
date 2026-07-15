import 'package:warunk/app/features/merchant/domain/entity/merchant_promotion.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_promotion_national.dart';
import 'package:warunk/core/network/data_state.dart';

abstract class MerchantPromotionRepository {
  Future<DataState<List<MerchantPromotionEntity>>> getPromotions();
  Future<DataState<MerchantPromotionEntity>> getPromotionById(String id);
  Future<DataState<List<MerchantPromotionNationalEntity>>> getNationalPromotions();
  Future<DataState<bool>> createPromotion({
    required MerchantPromotionSendParam request,
  });
  Future<DataState<bool>> updatePromotion({
    required String id,
    required MerchantPromotionSendParam request,
  });
  Future<DataState> deletePromotion(String id);
  Future<DataState<bool>> joinNationalPromotion(String id);
}
