import 'package:warunk/app/features/auth/data/source/auth_api_service.dart';
import 'package:warunk/app/features/auth/domain/entity/auth.dart';
import 'package:warunk/app/features/auth/domain/entity/login.dart';
import 'package:warunk/app/features/auth/domain/entity/register.dart';
import 'package:warunk/core/constants/constant.dart';
import 'package:warunk/core/helper/shared_preferences_helper.dart';
import 'package:warunk/core/network/data_state.dart';

class AuthRepository {
  final AuthApiService _api;

  AuthRepository({required AuthApiService api}) : _api = api;

  Future<DataState> login({required LoginParam param}) async {
    return handleResponse(() => _api.login(body: param.toJson()), (
      responseData,
    ) async {
      final auth = AuthEntity.fromJson(responseData);
      await SharedPreferencesHelper.setString(
        PREF_AUTH,
        '${auth.tokenType} ${auth.token}',
      );
      await SharedPreferencesHelper.setString(PREF_NAME, auth.user.name);
      await SharedPreferencesHelper.setString(PREF_EMAIL, auth.user.email);
      return null;
    });
  }

  Future<DataState> register({required RegisterSendParam param}) async {
    return handleResponse(() => _api.register(body: param.toJson()), (
      responseData,
    ) async {
      return null;
    });
  }
}
