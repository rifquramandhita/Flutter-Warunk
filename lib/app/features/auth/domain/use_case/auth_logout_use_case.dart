import 'package:warunk/app/features/auth/domain/repository/auth_repository.dart';
import 'package:warunk/core/constants/constant.dart';
import 'package:warunk/core/helper/shared_preferences_helper.dart';
import 'package:warunk/core/network/data_state.dart';

class AuthLogoutUseCase {
  final AuthRepository _repository;

  AuthLogoutUseCase({required AuthRepository repository})
    : _repository = repository;

  Future<DataState> call() async {
    final response = await _repository.logout();
    
    await SharedPreferencesHelper.remove(PREF_AUTH);
    await SharedPreferencesHelper.remove(PREF_NAME);
    await SharedPreferencesHelper.remove(PREF_EMAIL);
    await SharedPreferencesHelper.remove(PREF_PHONE);
    await SharedPreferencesHelper.remove(PREF_PHOTO);
    await SharedPreferencesHelper.remove(PREF_ROLE);
    
    return response;
  }
}
