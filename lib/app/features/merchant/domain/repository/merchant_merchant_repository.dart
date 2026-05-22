import 'package:warunk/app/features/merchant/domain/entity/merchant_merchant.dart';
import 'package:warunk/core/network/data_state.dart';

abstract class MerchantMerchantRepository {
  Future<DataState<MerchantMerchantEntity>> get();
}
