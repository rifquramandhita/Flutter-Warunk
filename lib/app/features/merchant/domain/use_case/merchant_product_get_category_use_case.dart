import 'package:warunk/app/features/merchant/domain/entity/merchant_product_category.dart';
import 'package:warunk/app/features/merchant/domain/repository/merchant_product_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class MerchantProductGetCategoryUseCase {
  final MerchantProductRepository repository;

  MerchantProductGetCategoryUseCase({required this.repository});

  Future<DataState<List<MerchantProductCategoryEntity>>> call() {
    return repository.getCategories();
  }
}
