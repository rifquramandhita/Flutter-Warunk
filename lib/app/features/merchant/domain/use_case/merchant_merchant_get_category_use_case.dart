import 'package:warunk/app/features/merchant/domain/entity/merchant_category.dart';
import 'package:warunk/app/features/merchant/domain/repository/merchant_merchant_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class MerchantMerchantGetCategoryUseCase {
  final MerchantMerchantRepository _repository;

  MerchantMerchantGetCategoryUseCase({
    required MerchantMerchantRepository repository,
  }) : _repository = repository;

  Future<DataState<List<MerchantCategoryEntity>>> call() async {
    return await _repository.getCategories();
  }
}
