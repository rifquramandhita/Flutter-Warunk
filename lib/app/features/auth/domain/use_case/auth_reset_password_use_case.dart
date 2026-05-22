import 'package:warunk/app/features/auth/domain/entity/reset_password.dart';
import 'package:warunk/app/features/auth/domain/repository/auth_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class AuthResetPasswordUseCase {
  final AuthRepository _repository;

  AuthResetPasswordUseCase({required AuthRepository repository}) : _repository = repository;

  Future<DataState> call({required ResetPasswordParam param}) {
    return _repository.resetPassword(param: param);
  }
}
