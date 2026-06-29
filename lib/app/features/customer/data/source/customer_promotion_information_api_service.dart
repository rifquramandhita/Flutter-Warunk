import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:warunk/core/constants/constant.dart';

part 'customer_promotion_information_api_service.g.dart';

@RestApi(baseUrl: BASE_URL_PROD)
abstract class CustomerPromotionInformationApiService {
  factory CustomerPromotionInformationApiService(Dio dio, {String baseUrl}) =
      _CustomerPromotionInformationApiService;

  @GET('/api/promo-informations')
  Future<HttpResponse<dynamic>> get();
}
