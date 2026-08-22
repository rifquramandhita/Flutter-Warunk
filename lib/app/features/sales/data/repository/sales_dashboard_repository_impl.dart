import 'package:warunk/app/features/sales/data/source/sales_dashboard_api_service.dart';
import 'package:warunk/app/features/sales/domain/entity/sales_dashboard.dart';
import 'package:warunk/app/features/sales/domain/repository/sales_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class SalesRepositoryImpl implements SalesRepository {
  final SalesDashboardApiService _apiService;

  SalesRepositoryImpl({required SalesDashboardApiService apiService})
      : _apiService = apiService;

  @override
  Future<DataState<SalesDashboardEntity>> getSellerDashboard({
    String? salesScope,
    int? districtId,
    String? salesMetric,
    String? districtMetric,
    String? merchantMetric,
  }) async {
    return handleResponse<SalesDashboardEntity>(
      () => _apiService.getDashboard(
        salesScope: salesScope,
        districtId: districtId,
        salesMetric: salesMetric,
        districtMetric: districtMetric,
        merchantMetric: merchantMetric,
      ),
      (json) => SalesDashboardEntity.fromJson(json),
    );
  }
}
