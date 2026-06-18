import 'package:warunk/app/features/merchant/data/source/merchant_dashboard_api_service.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_dashboard.dart';
import 'package:warunk/app/features/merchant/domain/repository/merchant_dashboard_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class MerchantDashboardRepositoryImpl implements MerchantDashboardRepository {
  final MerchantDashboardApiService api;

  MerchantDashboardRepositoryImpl({required this.api});

  @override
  Future<DataState<MerchantDashboardEntity>> get() {
    return handleResponse(() => api.get(), (responseData) {
      return MerchantDashboardEntity.fromJson(responseData);
    });
  }
}
