import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/core/constants/constant.dart';
import 'package:warunk/core/helper/shared_preferences_helper.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<AuthEventCheck>(_onCheck);
  }

  /// Cek token di SecureStorage — dipanggil saat splash screen
  Future<void> _onCheck(AuthEventCheck event, Emitter<AuthState> emit) async {
    final token = await SharedPreferencesHelper.getString(PREF_AUTH);
    if (token != null && token.isNotEmpty) {
      final name = await SharedPreferencesHelper.getString(PREF_NAME) ?? '';
      final email = await SharedPreferencesHelper.getString(PREF_EMAIL) ?? '';
      emit(
        state.copyWith(
          name: name,
          email: email,
          isAuthenticated: true,
          isLoading: false,
        ),
      );
    } else {
      emit(state.copyWith(isAuthenticated: false, isLoading: false));
    }
  }
}
