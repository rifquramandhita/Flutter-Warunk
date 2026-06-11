import 'package:warunk/app/features/merchant/domain/entity/merchant_order.dart';
import 'package:warunk/core/network/data_state.dart';

abstract class MerchantOrderRepository {
  Future<DataState<List<MerchantOrderEntity>>> getOrders();
  Future<DataState<MerchantOrderEntity>> getOrderById(String id);
  Future<DataState<MerchantOrderEntity>> acceptOrder(String id);
  Future<DataState<MerchantOrderEntity>> shipOrder(String id, Map<String, dynamic> body);
  Future<DataState<MerchantOrderEntity>> receivedOrder(String id);
  Future<DataState<MerchantOrderEntity>> rejectOrder(String id, MerchantOrderRejectParam param);
}
