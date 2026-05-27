import 'package:warunk/app/features/merchant/domain/entity/merchant_order.dart';
import 'package:warunk/app/features/merchant/domain/repository/merchant_order_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class MerchantOrderGetByIdUseCase {
  final MerchantOrderRepository _repository;

  MerchantOrderGetByIdUseCase(this._repository);

  @override
  Future<DataState<MerchantOrderEntity>> call({String? params}) {
    return _repository.getOrderById(params!);
  }
}
