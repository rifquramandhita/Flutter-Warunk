import 'package:warunk/app/features/merchant/domain/entity/merchant_order.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_order_reject_param.dart';
import 'package:warunk/app/features/merchant/domain/repository/merchant_order_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class MerchantOrderRejectUseCase {
  final MerchantOrderRepository _repository;

  MerchantOrderRejectUseCase(this._repository);

  Future<DataState<MerchantOrderEntity>> call({
    required String id,
    required MerchantOrderRejectSendParam param,
  }) {
    return _repository.rejectOrder(id, param.toJson());
  }
}
