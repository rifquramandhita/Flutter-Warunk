import 'package:warunk/app/features/auth/domain/entity/register.dart';
import 'package:warunk/app/features/auth/domain/repository/auth_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class AuthRegisterUseCase {
  final AuthRepository _repository;

  AuthRegisterUseCase({required AuthRepository repository})
    : _repository = repository;

  Future<DataState> call({required RegisterSendParam param, required bool isCustomer}) async {
    if (isCustomer) {
      return await _repository.registerCustomer(param: param);
    } else {
      return await _repository.registerMerchant(param: param);
    }
  }
}
