import 'package:warunk/app/features/merchant/domain/entity/merchant_order.dart';
import 'package:warunk/app/features/merchant/domain/repository/merchant_order_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class MerchantOrderAcceptCancelUseCase {
  final MerchantOrderRepository _repository;

  MerchantOrderAcceptCancelUseCase(this._repository);

  @override
  Future<DataState<dynamic>> call({
    required MerchantOrderAcceptCancelParam params,
  }) {
    return _repository.acceptCancelOrder(params.id, params.refundProof!);
  }
}
