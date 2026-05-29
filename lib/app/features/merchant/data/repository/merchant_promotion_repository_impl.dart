import 'package:warunk/app/features/merchant/data/source/merchant_promotion_api_service.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_promotion.dart';
import 'package:warunk/app/features/merchant/domain/repository/merchant_promotion_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class MerchantPromotionRepositoryImpl implements MerchantPromotionRepository {
  final MerchantPromotionApiService _apiService;

  MerchantPromotionRepositoryImpl({required MerchantPromotionApiService apiService})
      : _apiService = apiService;

  @override
  Future<DataState<List<MerchantPromotionEntity>>> getPromotions() async {
    return handleResponse(() => _apiService.getPromotions(), (responseData) {
      final data = responseData['promotions'] as List;
      return data.map((e) => MerchantPromotionEntity.fromJson(e)).toList();
    });
  }
}
