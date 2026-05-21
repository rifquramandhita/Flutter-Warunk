import 'package:warunk/app/features/merchant/domain/entity/merchant_product.dart';
import 'package:warunk/core/network/data_state.dart';

abstract class MerchantProductRepository {
  Future<DataState<List<MerchantProduct>>> get();
}
