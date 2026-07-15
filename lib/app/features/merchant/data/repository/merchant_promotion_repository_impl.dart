import 'package:warunk/app/features/merchant/data/source/merchant_promotion_api_service.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_promotion.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_promotion_national.dart';
import 'package:warunk/app/features/merchant/domain/repository/merchant_promotion_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class MerchantPromotionRepositoryImpl implements MerchantPromotionRepository {
  final MerchantPromotionApiService _apiService;

  MerchantPromotionRepositoryImpl({
    required MerchantPromotionApiService apiService,
  }) : _apiService = apiService;

  @override
  Future<DataState<List<MerchantPromotionEntity>>> getPromotions() async {
    return handleResponse(() => _apiService.getPromotions(), (responseData) {
      final data = responseData['promotions'] as List;
      return data.map((e) => MerchantPromotionEntity.fromJson(e)).toList();
    });
  }

  @override
  Future<DataState<List<MerchantPromotionNationalEntity>>> getNationalPromotions() async {
    return handleResponse(() => _apiService.getNationalPromotions(), (responseData) {
      final data = responseData['promotions'] as List;
      return data.map((e) => MerchantPromotionNationalEntity.fromJson(e)).toList();
    });
  }
  @override
  Future<DataState<MerchantPromotionEntity>> getPromotionById(String id) async {
    return handleResponse(() => _apiService.getPromotionById(id), (responseData) {
      return MerchantPromotionEntity.fromJson(responseData['promotion']);
    });
  }

  @override
  Future<DataState<bool>> createPromotion({
    required MerchantPromotionSendParam request,
  }) async {
    return handleResponse(
      () => _apiService.createPromotion(request.toJson()),
      (responseData) => true,
    );
  }

  @override
  Future<DataState<bool>> updatePromotion({
    required String id,
    required MerchantPromotionSendParam request,
  }) async {
    return handleResponse(
      () => _apiService.updatePromotion(id, request.toJson()),
      (responseData) => true,
    );
  }

  @override
  Future<DataState> deletePromotion(String id) async {
    return handleResponse(
      () => _apiService.deletePromotion(id),
      (responseData) => true,
    );
  }

  @override
  Future<DataState<bool>> joinNationalPromotion(String id) async {
    return handleResponse(
      () => _apiService.joinNationalPromotion(id),
      (responseData) => true,
    );
  }
}
