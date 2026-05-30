import 'package:warunk/app/features/customer/domain/entity/customer_profil_update_param.dart';
import 'package:warunk/app/features/customer/domain/repository/customer_profil_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class CustomerProfilUpdateUseCase {
  final CustomerProfilRepository _repository;

  CustomerProfilUpdateUseCase({required CustomerProfilRepository repository})
      : _repository = repository;

  Future<DataState<dynamic>> call({required CustomerProfilUpdateParam param}) {
    return _repository.update(param: param);
  }
}
