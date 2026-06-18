import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'merchant_dashboard_api_service.g.dart';

@RestApi()
abstract class MerchantDashboardApiService {
  factory MerchantDashboardApiService(Dio dio) => _MerchantDashboardApiService(dio);

  @GET('/api/seller/dashboard')
  Future<HttpResponse<dynamic>> get();
}
