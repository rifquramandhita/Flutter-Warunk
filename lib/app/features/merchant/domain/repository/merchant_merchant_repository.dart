import 'package:warunk/app/features/merchant/domain/entity/merchant_account.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_merchant.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_operational_hour.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_shipping.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_category.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_balance_history.dart';
import 'package:warunk/core/network/data_state.dart';

abstract class MerchantMerchantRepository {
  Future<DataState<MerchantMerchantEntity>> get();
  Future<DataState<MerchantBalanceHistorySummaryEntity>> getHistoryBalance();
  Future<DataState<List<MerchantCategoryEntity>>> getCategories();
  Future<DataState<List<String>>> getCourier();
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
  Future<DataState<dynamic>> updateAccount({
    required List<MerchantAccountUpdateParam> accounts,
  });
  Future<DataState<dynamic>> updateOperationalHours(
      {required MerchantOperationalHourUpdateParam param});
  Future<DataState<dynamic>> updateShipping(
      {required MerchantShippingUpdateParam param});
  Future<DataState<dynamic>> open();
  Future<DataState<dynamic>> close();
  Future<DataState<String>> topUpBalance({required int amount});
}
