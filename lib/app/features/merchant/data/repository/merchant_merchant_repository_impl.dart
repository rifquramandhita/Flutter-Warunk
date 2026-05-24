import 'package:warunk/app/features/merchant/data/source/merchant_merchant_api_service.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_account.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_merchant.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_operational_hour.dart';
import 'package:warunk/app/features/merchant/domain/repository/merchant_merchant_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class MerchantMerchantRepositoryImpl implements MerchantMerchantRepository {
  final MerchantMerchantApiService _api;

  MerchantMerchantRepositoryImpl({required MerchantMerchantApiService api})
    : _api = api;

  @override
  Future<DataState<MerchantMerchantEntity>> get() async {
    return handleResponse(() => _api.get(), (responseData) {
      return MerchantMerchantEntity.fromJson(responseData['merchant']);
    });
  }

  @override
  Future<DataState<dynamic>> update(
      {required MerchantMerchantUpdateParam param}) async {
    return handleResponse(
      () => _api.update(
        param.photo,
        param.name,
        param.slug,
        param.merchantCategoryName,
        param.whatsappNumber,
      ),
      (responseData) {
        return responseData;
      },
    );
  }

  @override
  Future<DataState<dynamic>> updateLocation({
    required String address,
    required String province,
    required String city,
    required String district,
    required String postalCode,
    required double longitude,
    required double latitude,
  }) async {
    return handleResponse(
      () => _api.updateLocation({
        'address': address,
        'province': province,
        'city': city,
        'district': district,
        'postal_code': postalCode,
        'longitude': longitude,
        'latitude': latitude,
      }),
      (responseData) {
        return responseData;
      },
    );
  }

  @override
  Future<DataState<dynamic>> updateAccount({
    required List<MerchantAccountUpdateParam> accounts,
  }) async {
    return handleResponse(
      () => _api.updateAccount({
        'merchant_accounts': accounts
            .map((e) => {
                  'bank_name': e.bankName,
                  'account_name': e.accountName,
                  'account_number': e.accountNumber,
                })
            .toList(),
      }),
      (responseData) {
        return responseData;
      },
    );
  }

  @override
  Future<DataState<dynamic>> updateOperationalHours(
      {required MerchantOperationalHourUpdateParam param}) async {
    return handleResponse(
      () => _api.updateOperationalHours(param.toJson()),
      (responseData) {
        return responseData;
      },
    );
  }

  @override
  Future<DataState<dynamic>> open() async {
    return handleResponse(
      () => _api.open(),
      (responseData) {
        return responseData;
      },
    );
  }

  @override
  Future<DataState<dynamic>> close() async {
    return handleResponse(
      () => _api.close(),
      (responseData) {
        return responseData;
      },
    );
  }
}
