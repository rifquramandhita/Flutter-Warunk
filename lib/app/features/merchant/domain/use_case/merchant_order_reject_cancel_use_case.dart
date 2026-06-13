import 'package:warunk/app/features/merchant/domain/entity/merchant_order.dart';
import 'package:warunk/app/features/merchant/domain/repository/merchant_order_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class MerchantOrderRejectCancelUseCase {
  final MerchantOrderRepository _repository;

  MerchantOrderRejectCancelUseCase(this._repository);

  @override
  Future<DataState<dynamic>> call({
    required MerchantOrderRejectCancelParam params,
  }) {
    return _repository.rejectCancelOrder(params.id, params.reason);
  }
}
