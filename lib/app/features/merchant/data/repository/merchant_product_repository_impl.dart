import 'package:warunk/app/features/merchant/data/source/merchant_product_api_service.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_product.dart';
import 'package:warunk/app/features/merchant/domain/repository/merchant_product_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class MerchantProductRepositoryImpl implements MerchantProductRepository {
  final MerchantProductApiService api;

  MerchantProductRepositoryImpl({required this.api});

  @override
  Future<DataState<List<MerchantProductEntity>>> get() {
    return handleResponse(() => api.get(), (responseData) {
      return List<MerchantProductEntity>.from(
        responseData['products'].map((e) => MerchantProductEntity.fromJson(e)),
      );
    });
  }
}
