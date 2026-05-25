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
}
