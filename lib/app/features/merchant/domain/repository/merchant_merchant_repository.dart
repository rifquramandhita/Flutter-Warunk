import 'package:warunk/app/features/merchant/domain/entity/merchant_merchant.dart';
import 'package:warunk/core/network/data_state.dart';

abstract class MerchantMerchantRepository {
  Future<DataState<MerchantMerchantEntity>> get();
  Future<DataState<dynamic>> update(
      {required MerchantMerchantUpdateParam param});
  Future<DataState<dynamic>> updateLocation({
    required String address,
    required String province,
    required String city,
    required String district,
    required String postalCode,
    required double longitude,
    required double latitude,
  });
}
