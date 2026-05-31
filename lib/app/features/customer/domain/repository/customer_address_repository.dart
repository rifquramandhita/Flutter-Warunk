import 'package:warunk/app/features/customer/domain/entity/customer_address.dart';
import 'package:warunk/core/network/data_state.dart';

abstract class CustomerAddressRepository {
  Future<DataState<List<CustomerAddressEntity>>> get();
  Future<DataState<CustomerAddressEntity>> getById(String id);
  Future<DataState<dynamic>> insert({required CustomerAddressSendParam param});
  Future<DataState<dynamic>> update({required CustomerAddressSendParam param});
  Future<DataState<dynamic>> setAsDefault(String id);
}
