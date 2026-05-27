import 'package:warunk/app/features/merchant/domain/entity/merchant_order.dart';
import 'package:warunk/app/features/merchant/domain/repository/merchant_order_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class MerchantOrderReceivedUseCase {
  final MerchantOrderRepository _repository;

  MerchantOrderReceivedUseCase(this._repository);

  Future<DataState<MerchantOrderEntity>> call({required String id}) {
    return _repository.receivedOrder(id);
  }
}
