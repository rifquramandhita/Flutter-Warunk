import 'package:warunk/core/network/data_state.dart';
import 'package:warunk/app/features/sales/domain/entity/sales_dashboard.dart';

abstract class SalesRepository {
  Future<DataState<SalesDashboardEntity>> getSellerDashboard({
    String? salesScope,
    int? districtId,
    String? salesMetric,
    String? districtMetric,
    String? merchantMetric,
  });
}
