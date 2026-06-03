import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'customer_cart_api_service.g.dart';

@RestApi()
abstract class CustomerCartApiService {
  factory CustomerCartApiService(Dio dio, {String baseUrl}) = _CustomerCartApiService;

  @POST('/api/carts')
  Future<HttpResponse<dynamic>> addCart(@Body() Map<String, dynamic> body);
}
