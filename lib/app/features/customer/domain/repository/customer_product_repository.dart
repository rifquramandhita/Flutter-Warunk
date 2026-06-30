import 'package:warunk/app/features/customer/domain/entity/customer_product.dart';
import 'package:warunk/core/network/data_state.dart';

abstract class CustomerProductRepository {
  Future<DataState<List<CustomerProductEntity>>> getProducts({String? merchantId, String? keyword});
  Future<DataState<CustomerProductEntity>> getById(String productId);
}
