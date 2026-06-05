import 'package:warunk/app/features/customer/domain/entity/customer_cart_add_param.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_cart_update_param.dart';
import 'package:warunk/core/network/data_state.dart';

import 'package:warunk/app/features/customer/domain/entity/customer_cart.dart';

abstract class CustomerCartRepository {
  Future<DataState<dynamic>> addCart(CustomerCartAddParam param);
  Future<DataState<List<CustomerCartEntity>>> getCarts();
  Future<DataState<dynamic>> deleteCart(String cartId);
  Future<DataState<dynamic>> updateCart(CustomerCartUpdateParam param);
}
