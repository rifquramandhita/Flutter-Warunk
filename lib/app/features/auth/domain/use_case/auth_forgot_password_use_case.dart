import 'package:warunk/app/features/auth/domain/entity/forgot_password.dart';
import 'package:warunk/app/features/auth/domain/repository/auth_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class AuthForgotPasswordUseCase {
  final AuthRepository _repository;

  AuthForgotPasswordUseCase({required AuthRepository repository})
    : _repository = repository;

  Future<DataState> call({
    required String email,
  }) async {
    final param = ForgotPasswordParam(email: email);
    return await _repository.forgotPassword(param: param);
  }
}
