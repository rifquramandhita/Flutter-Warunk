import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:warunk/core/constants/constant.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_promotion.dart';

part 'merchant_promotion_api_service.g.dart';

@RestApi(baseUrl: BASE_URL_PROD)
abstract class MerchantPromotionApiService {
  factory MerchantPromotionApiService(Dio dio, {String baseUrl}) =
      _MerchantPromotionApiService;

  @GET(MERCHANT_PROMOTIONS)
  Future<HttpResponse<dynamic>> getPromotions();

  @GET('$MERCHANT_PROMOTIONS/{id}')
  Future<HttpResponse<dynamic>> getPromotionById(
    @Path('id') String id,
  );

  @POST(MERCHANT_PROMOTIONS)
  Future<HttpResponse<dynamic>> createPromotion(
    @Body() Map<String, dynamic> request,
  );

  @PUT('$MERCHANT_PROMOTIONS/{id}')
  Future<HttpResponse<dynamic>> updatePromotion(
    @Path('id') String id,
    @Body() Map<String, dynamic> request,
  );

  @DELETE('$MERCHANT_PROMOTIONS/{id}')
  Future<HttpResponse<dynamic>> deletePromotion(
    @Path('id') String id,
  );
}
