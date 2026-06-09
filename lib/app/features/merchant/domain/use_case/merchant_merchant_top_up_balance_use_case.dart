import 'package:warunk/app/features/merchant/domain/repository/merchant_merchant_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class MerchantMerchantTopUpBalanceUseCase {
  final MerchantMerchantRepository repository;

  MerchantMerchantTopUpBalanceUseCase(this.repository);

  Future<DataState<String>> call(int amount) async {
    return await repository.topUpBalance(amount: amount);
  }
}
