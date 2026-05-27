import 'package:warunk/app/features/merchant/data/source/merchant_order_api_service.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_order.dart';
import 'package:warunk/app/features/merchant/domain/repository/merchant_order_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class MerchantOrderRepositoryImpl implements MerchantOrderRepository {
  final MerchantOrderApiService _apiService;

  MerchantOrderRepositoryImpl({required MerchantOrderApiService apiService})
      : _apiService = apiService;

  @override
  Future<DataState<List<MerchantOrderEntity>>> getOrders() async {
    return handleResponse(() => _apiService.getOrders(), (responseData) {
      final data = responseData['orders'] as List;
      return data.map((e) => MerchantOrderEntity.fromJson(e)).toList();
    });
  }

  @override
  Future<DataState<MerchantOrderEntity>> getOrderById(String id) async {
    return handleResponse(() => _apiService.getOrderById(id), (responseData) {
      final data = responseData['order'];
      return MerchantOrderEntity.fromJson(data);
    });
  }

  @override
  Future<DataState<MerchantOrderEntity>> acceptOrder(String id) async {
    return handleResponse(() => _apiService.acceptOrder(id), (responseData) {
      final data = responseData['order'];
      return MerchantOrderEntity.fromJson(data);
    });
  }

  @override
  Future<DataState<MerchantOrderEntity>> shipOrder(String id, Map<String, dynamic> body) async {
    return handleResponse(() => _apiService.shipOrder(id, body), (responseData) {
      final data = responseData['order'];
      return MerchantOrderEntity.fromJson(data);
    });
  }

  @override
  Future<DataState<MerchantOrderEntity>> receivedOrder(String id) async {
    return handleResponse(() => _apiService.receivedOrder(id), (responseData) {
      final data = responseData['order'];
      return MerchantOrderEntity.fromJson(data);
    });
  }

  @override
  Future<DataState<MerchantOrderEntity>> rejectOrder(String id, Map<String, dynamic> body) async {
    return handleResponse(() => _apiService.rejectOrder(id, body), (responseData) {
      final data = responseData['order'];
      return MerchantOrderEntity.fromJson(data);
    });
  }
}
