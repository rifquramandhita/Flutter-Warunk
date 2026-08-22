import 'package:warunk/app/features/sales/domain/entity/sales_dashboard.dart';
import 'package:warunk/app/features/sales/domain/repository/sales_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class SellerDashboardGetUseCase {
  final SalesRepository _repository;

  SellerDashboardGetUseCase({required SalesRepository repository})
      : _repository = repository;

  Future<DataState<SalesDashboardEntity>> call({
    String? salesScope,
    int? districtId,
    String? salesMetric,
    String? districtMetric,
    String? merchantMetric,
  }) async {
    return await _repository.getSellerDashboard(
      salesScope: salesScope,
      districtId: districtId,
      salesMetric: salesMetric,
      districtMetric: districtMetric,
      merchantMetric: merchantMetric,
    );
  }
}
