import 'package:warunk/app/features/merchant/data/source/merchant_region_api_service.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_district.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_province.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_regency.dart';
import 'package:warunk/app/features/merchant/domain/repository/merchant_region_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class MerchantRegionRepositoryImpl implements MerchantRegionRepository {
  final MerchantRegionApiService apiService;

  MerchantRegionRepositoryImpl({
    MerchantRegionApiService? apiService,
    MerchantRegionApiService? api,
  }) : apiService = (apiService ?? api)!;

  @override
  Future<DataState<List<MerchantProvinceEntity>>> getProvinces() async {
    return handleResponse(
      () => apiService.getProvinces(),
      (responseData) {
        final List<dynamic> provinces =
            responseData is Map<String, dynamic> &&
                    responseData['provinces'] != null
                ? responseData['provinces'] as List<dynamic>
                : responseData is List<dynamic>
                    ? responseData
                    : [];
        return provinces
            .map(
              (e) =>
                  MerchantProvinceEntity.fromJson(e as Map<String, dynamic>),
            )
            .toList();
      },
    );
  }

  @override
  Future<DataState<List<MerchantRegencyEntity>>> getRegencies(
    String provinceId,
  ) async {
    return handleResponse(
      () => apiService.getRegencies(provinceId),
      (responseData) {
        final List<dynamic> regencies =
            responseData is Map<String, dynamic> &&
                    responseData['regencies'] != null
                ? responseData['regencies'] as List<dynamic>
                : responseData is List<dynamic>
                    ? responseData
                    : [];
        return regencies
            .map(
              (e) =>
                  MerchantRegencyEntity.fromJson(e as Map<String, dynamic>),
            )
            .toList();
      },
    );
  }

  @override
  Future<DataState<List<MerchantDistrictEntity>>> getDistricts(
    String regencyId,
  ) async {
    return handleResponse(
      () => apiService.getDistricts(regencyId),
      (responseData) {
        final List<dynamic> districts =
            responseData is Map<String, dynamic> &&
                    responseData['districts'] != null
                ? responseData['districts'] as List<dynamic>
                : responseData is List<dynamic>
                    ? responseData
                    : [];
        return districts
            .map(
              (e) =>
                  MerchantDistrictEntity.fromJson(e as Map<String, dynamic>),
            )
            .toList();
      },
    );
  }
}
