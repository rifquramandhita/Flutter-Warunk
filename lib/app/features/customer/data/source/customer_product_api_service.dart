import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'customer_product_api_service.g.dart';

@RestApi()
abstract class CustomerProductApiService {
  factory CustomerProductApiService(Dio dio, {String baseUrl}) =
      _CustomerProductApiService;

  @GET('/api/products')
  Future<HttpResponse<dynamic>> getProducts(
    @Query('merchant_id') String? merchantId,
    @Query('keyword') String? keyword,
  );

  @GET('/api/products/{product}')
  Future<HttpResponse<dynamic>> getById(
    @Path('product') String productId,
  );
}
