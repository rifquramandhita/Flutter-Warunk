import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:warunk/core/constants/constant.dart';

part 'merchant_promotion_api_service.g.dart';

@RestApi(baseUrl: BASE_URL_PROD)
abstract class MerchantPromotionApiService {
  factory MerchantPromotionApiService(Dio dio, {String baseUrl}) =
      _MerchantPromotionApiService;

  @GET(MERCHANT_PROMOTIONS)
  Future<HttpResponse<dynamic>> getPromotions();
}
