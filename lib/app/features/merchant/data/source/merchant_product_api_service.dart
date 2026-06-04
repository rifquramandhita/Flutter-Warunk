import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'merchant_product_api_service.g.dart';

@RestApi()
abstract class MerchantProductApiService {
  factory MerchantProductApiService(Dio dio) => _MerchantProductApiService(dio);

  @GET('/api/seller/products/categories')
  Future<HttpResponse<dynamic>> getCategories();

  @GET('/api/seller/products')
  Future<HttpResponse<dynamic>> get();

  @GET('/api/seller/products/{id}')
  Future<HttpResponse<dynamic>> getById(@Path('id') String id);

  @POST('/api/seller/products')
  Future<HttpResponse<dynamic>> create(@Body() FormData body);

  @PUT('/api/seller/products/{id}')
  Future<HttpResponse<dynamic>> update(
    @Path('id') String id,
    @Body() FormData body,
  );

  @POST('/api/seller/products/{id}/publish')
  Future<HttpResponse<dynamic>> publish(@Path('id') String id);

  @POST('/api/seller/products/{id}/unpublish')
  Future<HttpResponse<dynamic>> unpublish(@Path('id') String id);

  @DELETE('/api/seller/products/{id}')
  Future<HttpResponse<dynamic>> delete(@Path('id') String id);
}
