import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'merchant_product_api_service.g.dart';

@RestApi()
abstract class MerchantProductApiService {
  factory MerchantProductApiService(Dio dio) => _MerchantProductApiService(dio);

  @GET('/api/seller/products')
  Future<HttpResponse<dynamic>> get();
}
