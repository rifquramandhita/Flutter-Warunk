import 'package:warunk/app/features/merchant/domain/entity/merchant_product.dart';
import 'package:warunk/app/features/merchant/domain/repository/merchant_product_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class MerchantProductGetByIdUseCase {
  final MerchantProductRepository repository;

  MerchantProductGetByIdUseCase({required this.repository});

  Future<DataState<MerchantProductEntity>> call({required String id}) {
    return repository.getById(id);
  }
}
