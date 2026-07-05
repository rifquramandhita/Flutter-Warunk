import 'package:warunk/app/features/merchant/domain/entity/merchant_order.dart';
import 'package:warunk/app/features/merchant/domain/repository/merchant_order_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class MerchantOrderCompleteUseCase {
  final MerchantOrderRepository _repository;

  MerchantOrderCompleteUseCase(this._repository);

  Future<DataState<MerchantOrderEntity>> call({String? params}) {
    return _repository.completeOrder(params!);
  }
}
