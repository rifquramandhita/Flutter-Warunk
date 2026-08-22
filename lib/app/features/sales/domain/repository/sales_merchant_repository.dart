import 'package:warunk/core/network/data_state.dart';
import 'package:warunk/app/features/sales/domain/entity/sales_merchant.dart';

abstract class SalesMerchantRepository {
  Future<DataState<SalesMerchantResponseEntity>> getSalesMerchants({
    int? page,
    int? perPage,
    String? keyword,
  });

  Future<DataState<bool>> claimMerchant(String id);

  Future<DataState<String>> getMerchantWebviewUrl(String id);
}
