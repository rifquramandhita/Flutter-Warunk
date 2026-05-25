import 'package:warunk/app/features/merchant/domain/entity/merchant_order.dart';
import 'package:warunk/app/features/merchant/domain/repository/merchant_order_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class MerchantOrderGetUseCase {
  final MerchantOrderRepository _repository;

  MerchantOrderGetUseCase(this._repository);

  @override
  Future<DataState<List<MerchantOrderEntity>>> call({void params}) {
    return _repository.getOrders();
  }
}
