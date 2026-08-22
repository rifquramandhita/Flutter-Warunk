import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'sales_dashboard_api_service.g.dart';

@RestApi()
abstract class SalesDashboardApiService {
  factory SalesDashboardApiService(Dio dio) => _SalesDashboardApiService(dio);

  @GET('/api/sales/dashboard')
  Future<HttpResponse<dynamic>> getDashboard({
    @Query('sales_scope') String? salesScope,
    @Query('district_id') int? districtId,
    @Query('sales_metric') String? salesMetric,
    @Query('district_metric') String? districtMetric,
    @Query('merchant_metric') String? merchantMetric,
  });
}
