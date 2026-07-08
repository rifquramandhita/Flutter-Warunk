import 'package:warunk/app/features/customer/domain/entity/customer_merchant.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_merchant_category.dart';
import 'package:warunk/core/network/data_state.dart';

abstract class CustomerMerchantRepository {
  Future<DataState<List<CustomerMerchantEntity>>> get({String? category, String? keyword});
  Future<DataState<CustomerMerchantEntity>> getById(String id);
  Future<DataState<List<CustomerMerchantCategoryEntity>>> getCategories();
  Future<DataState<List<CustomerMerchantEntity>>> getNearby({required double latitude, required double longitude});
}
