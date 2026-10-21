import 'package:warunk/app/features/merchant/domain/entity/merchant_balance_history.dart';
import 'package:warunk/app/features/merchant/domain/repository/merchant_merchant_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class MerchantMerchantGetBalanceHistoryDetailUseCase {
  final MerchantMerchantRepository _repository;

  MerchantMerchantGetBalanceHistoryDetailUseCase(this._repository);

  Future<DataState<MerchantBalanceHistoryItemEntity>> call(String id) async {
    return await _repository.getBalanceHistoryDetail(id);
  }
}
