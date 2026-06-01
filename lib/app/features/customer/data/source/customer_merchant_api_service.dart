import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:warunk/core/constants/constant.dart';

part 'customer_merchant_api_service.g.dart';

@RestApi(baseUrl: BASE_URL_PROD)
abstract class CustomerMerchantApiService {
  factory CustomerMerchantApiService(Dio dio, {String baseUrl}) =
      _CustomerMerchantApiService;

  @GET('/api/merchants')
  Future<HttpResponse<dynamic>> get();

  @GET('/api/merchants/{id}')
  Future<HttpResponse<dynamic>> getById(@Path('id') String id);
}
