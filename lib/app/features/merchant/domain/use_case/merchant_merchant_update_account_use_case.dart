import 'package:warunk/app/features/merchant/domain/entity/merchant_account.dart';
import 'package:warunk/app/features/merchant/domain/repository/merchant_merchant_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class MerchantMerchantUpdateAccountUseCase {
  final MerchantMerchantRepository _repository;

  MerchantMerchantUpdateAccountUseCase(this._repository);

  Future<DataState<dynamic>> call({
    required List<MerchantAccountUpdateParam> accounts,
  }) async {
    return _repository.updateAccount(accounts: accounts);
  }
}
