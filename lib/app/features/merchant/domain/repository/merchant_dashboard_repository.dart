import 'package:warunk/app/features/merchant/domain/entity/merchant_dashboard.dart';
import 'package:warunk/core/network/data_state.dart';

abstract class MerchantDashboardRepository {
  Future<DataState<MerchantDashboardEntity>> get();
}
