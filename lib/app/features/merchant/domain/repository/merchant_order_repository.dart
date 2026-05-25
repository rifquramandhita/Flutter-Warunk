import 'package:warunk/app/features/merchant/domain/entity/merchant_order.dart';
import 'package:warunk/core/network/data_state.dart';

abstract class MerchantOrderRepository {
  Future<DataState<List<MerchantOrderEntity>>> getOrders();
}
