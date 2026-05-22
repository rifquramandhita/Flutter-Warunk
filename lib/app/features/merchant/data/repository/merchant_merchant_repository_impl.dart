import 'package:warunk/app/features/merchant/data/source/merchant_merchant_api_service.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_merchant.dart';
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
}
