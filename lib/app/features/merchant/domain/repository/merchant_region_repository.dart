import 'package:warunk/app/features/merchant/domain/entity/merchant_district.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_province.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_regency.dart';
import 'package:warunk/core/network/data_state.dart';

abstract class MerchantRegionRepository {
  Future<DataState<List<MerchantProvinceEntity>>> getProvinces();
  Future<DataState<List<MerchantRegencyEntity>>> getRegencies(String provinceId);
  Future<DataState<List<MerchantDistrictEntity>>> getDistricts(String regencyId);
}
