import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:warunk/app/features/auth/domain/entity/login.dart';
import 'package:warunk/app/features/auth/domain/repository/auth_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class AuthLoginUseCase {
  final AuthRepository _repository;

  AuthLoginUseCase({required AuthRepository repository})
    : _repository = repository;

  Future<DataState> call({
    required String email,
    required String password,
  }) async {
    final fcmToken = await FirebaseMessaging.instance.getToken() ?? 'unknown';
    final param = LoginParam(
      email: email,
      password: password,
      fcmToken: fcmToken,
    );
    return await _repository.login(param: param);
  }
}
