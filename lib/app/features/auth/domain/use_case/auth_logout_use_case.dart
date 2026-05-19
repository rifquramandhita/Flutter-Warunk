import 'package:warunk/app/features/auth/domain/repository/auth_repository.dart';
import 'package:warunk/core/constants/constant.dart';
import 'package:warunk/core/helper/shared_preferences_helper.dart';
import 'package:warunk/core/network/data_state.dart';

class AuthLogoutUseCase {
  final AuthRepository _repository;

  AuthLogoutUseCase({required AuthRepository repository})
    : _repository = repository;

  Future<DataState> call() async {
    await SharedPreferencesHelper.remove(PREF_AUTH);
    await SharedPreferencesHelper.remove(PREF_NAME);
    await SharedPreferencesHelper.remove(PREF_EMAIL);
    return SuccessState(message: 'Logout berhasil');
  }
}
