import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:warunk/core/constants/constant.dart';

part 'merchant_order_api_service.g.dart';

@RestApi(baseUrl: BASE_URL_PROD)
abstract class MerchantOrderApiService {
  factory MerchantOrderApiService(Dio dio, {String baseUrl}) =
      _MerchantOrderApiService;

  @GET(MERCHANT_ORDERS)
  Future<HttpResponse<dynamic>> getOrders();
}
