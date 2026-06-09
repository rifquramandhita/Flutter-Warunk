import 'package:warunk/app/features/merchant/domain/entity/merchant_balance_history.dart';
import 'package:warunk/app/features/merchant/domain/repository/merchant_merchant_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class MerchantMerchantGetHistoryBalanceUseCase {
  final MerchantMerchantRepository _repository;

  MerchantMerchantGetHistoryBalanceUseCase({
    required MerchantMerchantRepository repository,
  }) : _repository = repository;

  Future<DataState<MerchantBalanceHistorySummaryEntity>> call() {
    return _repository.getHistoryBalance();
  }
}
