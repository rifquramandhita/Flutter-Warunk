import 'package:warunk/app/features/merchant/domain/entity/merchant_dashboard.dart';
import 'package:warunk/app/features/merchant/domain/repository/merchant_dashboard_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class MerchantDashboardGetUseCase {
  final MerchantDashboardRepository _repository;

  MerchantDashboardGetUseCase({
    required MerchantDashboardRepository repository,
  }) : _repository = repository;

  Future<DataState<MerchantDashboardEntity>> call() {
    return _repository.get();
  }
}
