import 'package:warunk/app/features/customer/domain/entity/customer_address.dart';
import 'package:warunk/core/network/data_state.dart';

abstract class CustomerAddressRepository {
  Future<DataState<List<CustomerAddress>>> get();
}
