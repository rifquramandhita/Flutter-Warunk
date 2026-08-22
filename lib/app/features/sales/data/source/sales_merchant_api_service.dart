import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'sales_merchant_api_service.g.dart';

@RestApi()
abstract class SalesMerchantApiService {
  factory SalesMerchantApiService(Dio dio) => _SalesMerchantApiService(dio);

  @GET('/api/sales/merchants')
  Future<HttpResponse<dynamic>> getMerchants({
    @Query('page') int? page,
    @Query('per_page') int? perPage,
    @Query('keyword') String? keyword,
  });

  @POST('/api/sales/merchants/{id}/claim')
  Future<HttpResponse<dynamic>> claimMerchant(@Path('id') String id);

  @GET('/api/sales/merchants/{id}/webview-login')
  Future<HttpResponse<dynamic>> getMerchantWebviewUrl(@Path('id') String id);
}
