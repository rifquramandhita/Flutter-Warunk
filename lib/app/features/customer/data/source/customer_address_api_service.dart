import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:warunk/core/constants/constant.dart';

part 'customer_address_api_service.g.dart';

@RestApi(baseUrl: BASE_URL_PROD)
abstract class CustomerAddressApiService {
  factory CustomerAddressApiService(Dio dio, {String baseUrl}) =
      _CustomerAddressApiService;

  @GET('/api/user-addresses')
  Future<HttpResponse<dynamic>> get();
}
