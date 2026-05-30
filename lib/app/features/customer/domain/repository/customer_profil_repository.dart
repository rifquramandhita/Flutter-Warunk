import 'package:warunk/app/features/customer/domain/entity/customer_profil_update_param.dart';
import 'package:warunk/core/network/data_state.dart';

abstract class CustomerProfilRepository {
  Future<DataState<dynamic>> get();
  Future<DataState<dynamic>> update({required CustomerProfilUpdateParam param});
}
