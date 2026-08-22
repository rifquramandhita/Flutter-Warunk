import 'package:warunk/core/network/data_state.dart';
import 'package:warunk/app/features/sales/domain/repository/sales_merchant_repository.dart';

class SalesMerchantGetUrlWebUseCase {
  final SalesMerchantRepository _repository;

  SalesMerchantGetUrlWebUseCase({required SalesMerchantRepository repository})
      : _repository = repository;

  Future<DataState<String>> call({required String params}) {
    return _repository.getMerchantWebviewUrl(params);
  }
}
