import 'package:warunk/app/features/sales/data/source/sales_merchant_api_service.dart';
import 'package:warunk/app/features/sales/domain/entity/sales_merchant.dart';
import 'package:warunk/app/features/sales/domain/repository/sales_merchant_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class SalesMerchantRepositoryImpl implements SalesMerchantRepository {
  final SalesMerchantApiService _apiService;

  SalesMerchantRepositoryImpl({required SalesMerchantApiService apiService})
      : _apiService = apiService;

  @override
  Future<DataState<SalesMerchantResponseEntity>> getSalesMerchants({
    int? page,
    int? perPage,
    String? keyword,
  }) async {
    return handleResponse<SalesMerchantResponseEntity>(
      () => _apiService.getMerchants(
        page: page,
        perPage: perPage,
        keyword: keyword,
      ),
      (json) => SalesMerchantResponseEntity.fromJson(json),
    );
  }

  @override
  Future<DataState<bool>> claimMerchant(String id) async {
    return handleResponse<bool>(
      () => _apiService.claimMerchant(id),
      (json) => true,
    );
  }

  @override
  Future<DataState<String>> getMerchantWebviewUrl(String id) async {
    return handleResponse<String>(
      () => _apiService.getMerchantWebviewUrl(id),
      (json) => json['webview_url'] as String,
    );
  }
}
