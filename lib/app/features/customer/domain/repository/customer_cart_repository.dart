import 'package:warunk/app/features/customer/domain/entity/customer_cart_add_param.dart';
import 'package:warunk/core/network/data_state.dart';

abstract class CustomerCartRepository {
  Future<DataState<dynamic>> addCart(CustomerCartAddParam param);
}
