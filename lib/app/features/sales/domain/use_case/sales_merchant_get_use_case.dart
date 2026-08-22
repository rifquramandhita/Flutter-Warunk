import 'package:warunk/core/network/data_state.dart';
import 'package:warunk/app/features/sales/domain/entity/sales_merchant.dart';
import 'package:warunk/app/features/sales/domain/repository/sales_merchant_repository.dart';

class SalesMerchantGetUseCase {
  final SalesMerchantRepository _repository;

  SalesMerchantGetUseCase({required SalesMerchantRepository repository})
    : _repository = repository;

  @override
  Future<DataState<SalesMerchantResponseEntity>> call({
    SalesMerchantGetUseCaseParams? params,
  }) {
    return _repository.getSalesMerchants(
      page: params?.page,
      perPage: params?.perPage,
      keyword: params?.keyword,
    );
  }
}

class SalesMerchantGetUseCaseParams {
  final int? page;
  final int? perPage;
  final String? keyword;

  SalesMerchantGetUseCaseParams({this.page, this.perPage, this.keyword});
}
