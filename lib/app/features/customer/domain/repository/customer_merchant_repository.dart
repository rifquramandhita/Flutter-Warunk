import 'package:warunk/app/features/customer/domain/entity/customer_merchant.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_merchant_category.dart';
import 'package:warunk/core/network/data_state.dart';

abstract class CustomerMerchantRepository {
  Future<DataState<List<CustomerMerchantEntity>>> get({String? category});
  Future<DataState<CustomerMerchantEntity>> getById(String id);
  Future<DataState<List<CustomerMerchantCategoryEntity>>> getCategories();
}
