import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:warunk/core/constants/constant.dart';

part 'merchant_merchant_api_service.g.dart';

@RestApi(baseUrl: BASE_URL_PROD)
abstract class MerchantMerchantApiService {
  factory MerchantMerchantApiService(Dio dio, {String baseUrl}) =
      _MerchantMerchantApiService;

  @GET('/api/seller/merchant')
  Future<HttpResponse<dynamic>> get();
}
