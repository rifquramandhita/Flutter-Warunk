import 'package:warunk/app/features/customer/domain/entity/customer_merchant.dart';
import 'package:warunk/app/features/customer/domain/repository/customer_merchant_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class CustomerMerchantGetNearbyUseCase {
  final CustomerMerchantRepository _repository;

  CustomerMerchantGetNearbyUseCase({required CustomerMerchantRepository repository})
    : _repository = repository;

  Future<DataState<List<CustomerMerchantEntity>>> call({required double latitude, required double longitude}) {
    return _repository.getNearby(latitude: latitude, longitude: longitude);
  }
}
