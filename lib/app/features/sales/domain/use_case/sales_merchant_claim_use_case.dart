import 'package:warunk/core/network/data_state.dart';
import 'package:warunk/app/features/sales/domain/repository/sales_merchant_repository.dart';

class SalesMerchantClaimUseCase {
  final SalesMerchantRepository _repository;

  SalesMerchantClaimUseCase({required SalesMerchantRepository repository})
      : _repository = repository;

  Future<DataState<bool>> call({required String params}) {
    return _repository.claimMerchant(params);
  }
}
