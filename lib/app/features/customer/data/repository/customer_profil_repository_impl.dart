import 'package:warunk/app/features/customer/data/source/customer_profil_api_service.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_profil_update_param.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_user.dart';
import 'package:warunk/app/features/customer/domain/repository/customer_profil_repository.dart';
import 'package:warunk/core/constants/constant.dart';
import 'package:warunk/core/helper/shared_preferences_helper.dart';
import 'package:warunk/core/network/data_state.dart';

class CustomerProfilRepositoryImpl implements CustomerProfilRepository {
  final CustomerProfilApiService _apiService;

  CustomerProfilRepositoryImpl({required CustomerProfilApiService apiService})
    : _apiService = apiService;

  @override
  Future<DataState<dynamic>> get() {
    return handleResponse(() => _apiService.get(), (json) => json);
  }

  @override
  Future<DataState<dynamic>> update({
    required CustomerProfilUpdateParam param,
  }) {
    return handleResponse(
      () => _apiService.update(
        param.photo,
        param.name,
        param.email,
        param.phone,
        param.gender,
        param.birthDate,
      ),
      (responseData) async {
        final user = CustomerUserEntity.fromJson(responseData['user']);
        await SharedPreferencesHelper.setString(PREF_NAME, user.name);
        await SharedPreferencesHelper.setString(PREF_EMAIL, user.email);
        await SharedPreferencesHelper.setString(PREF_PHONE, user.phone);
        if (user.profilePhoto != null && user.profilePhoto!.isNotEmpty) {
          await SharedPreferencesHelper.setString(
            PREF_PHOTO,
            user.profilePhoto!,
          );
        }
        return null;
      },
    );
  }
}
