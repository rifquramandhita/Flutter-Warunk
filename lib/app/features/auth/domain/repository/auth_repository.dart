import 'package:warunk/app/features/auth/data/source/auth_api_service.dart';
import 'package:warunk/app/features/auth/domain/entity/auth.dart';
import 'package:warunk/app/features/auth/domain/entity/login.dart';
import 'package:warunk/app/features/auth/domain/entity/register.dart';
import 'package:warunk/app/features/auth/domain/entity/forgot_password.dart';
import 'package:warunk/app/features/auth/domain/entity/reset_password.dart';
import 'package:warunk/app/features/auth/domain/entity/reset_password.dart';
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
      await SharedPreferencesHelper.setString(PREF_PHONE, auth.user.phone);
      if (auth.user.profilePhoto != null &&
          auth.user.profilePhoto!.isNotEmpty) {
        await SharedPreferencesHelper.setString(
          PREF_PHOTO,
          auth.user.profilePhoto!,
        );
      }
      await SharedPreferencesHelper.setString(PREF_ROLE, param.role);
      return null;
    });
  }

  Future<DataState> loginGoogle({required LoginGoogleParam param}) async {
    return handleResponse(() => _api.loginGoogle(body: param.toJson()), (
      responseData,
    ) async {
      final auth = AuthEntity.fromJson(responseData);
      await SharedPreferencesHelper.setString(
        PREF_AUTH,
        '${auth.tokenType} ${auth.token}',
      );
      await SharedPreferencesHelper.setString(PREF_NAME, auth.user.name);
      await SharedPreferencesHelper.setString(PREF_EMAIL, auth.user.email);
      await SharedPreferencesHelper.setString(PREF_PHONE, auth.user.phone);
      if (auth.user.profilePhoto != null &&
          auth.user.profilePhoto!.isNotEmpty) {
        await SharedPreferencesHelper.setString(
          PREF_PHOTO,
          auth.user.profilePhoto!,
        );
      }
      await SharedPreferencesHelper.setString(PREF_ROLE, param.role);
      return null;
    });
  }

  Future<DataState> registerCustomer({required RegisterSendParam param}) async {
    return handleResponse(() => _api.registerCustomer(body: param.toJson()), (
      responseData,
    ) async {
      return null;
    });
  }

  Future<DataState> registerMerchant({required RegisterSendParam param}) async {
    return handleResponse(() => _api.registerMerchant(body: param.toJson()), (
      responseData,
    ) async {
      return null;
    });
  }

  Future<DataState> forgotPassword({required ForgotPasswordParam param}) async {
    return handleResponse(() => _api.forgotPassword(body: param.toJson()), (
      responseData,
    ) async {
      return null;
    });
  }

  Future<DataState> resetPassword({required ResetPasswordParam param}) async {
    return handleResponse(() => _api.resetPassword(body: param.toJson()), (
      responseData,
    ) async {
      return null;
    });
  }
}
