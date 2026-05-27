import 'package:warunk/app/features/merchant/domain/entity/merchant_order.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_order_ship_param.dart';
import 'package:warunk/app/features/merchant/domain/repository/merchant_order_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class MerchantOrderShipUseCase {
  final MerchantOrderRepository _repository;

  MerchantOrderShipUseCase(this._repository);

  Future<DataState<MerchantOrderEntity>> call({
    required String id,
    required MerchantOrderShipSendParam param,
  }) {
    return _repository.shipOrder(id, param.toJson());
  }
}
