import 'package:warunk/app/features/merchant/domain/repository/merchant_merchant_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class MerchantMerchantUpdateLocationUseCase {
  final MerchantMerchantRepository _repository;

  MerchantMerchantUpdateLocationUseCase(this._repository);

  Future<DataState<dynamic>> call({
    required String address,
    required String province,
    required String city,
    required String district,
    required String postalCode,
    required double longitude,
    required double latitude,
  }) async {
    return _repository.updateLocation(
      address: address,
      province: province,
      city: city,
      district: district,
      postalCode: postalCode,
      longitude: longitude,
      latitude: latitude,
    );
  }
}
