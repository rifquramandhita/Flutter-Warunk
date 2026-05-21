import 'package:warunk/app/features/auth/domain/entity/register.dart';
import 'package:warunk/app/features/auth/domain/repository/auth_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class AuthRegisterUseCase {
  final AuthRepository _repository;

  AuthRegisterUseCase({required AuthRepository repository})
    : _repository = repository;

  Future<DataState> call({required RegisterSendParam param}) async {
    return await _repository.register(param: param);
  }
}
