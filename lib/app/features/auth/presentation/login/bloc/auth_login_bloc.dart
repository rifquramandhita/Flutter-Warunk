import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_login_event.dart';
import 'auth_login_state.dart';

class AuthLoginBloc extends Bloc<AuthLoginEvent, AuthLoginState> {
  AuthLoginBloc() : super(const AuthLoginState()) {
    on<AuthObscurePasswordToggled>(_onObscurePasswordToggled);
    on<AuthRoleSelected>(_onRoleSelected);
    on<AuthLoginSubmitted>(_onLoginSubmitted);
  }

  void _onObscurePasswordToggled(AuthObscurePasswordToggled event, Emitter<AuthLoginState> emit) {
    emit(state.copyWith(obscurePassword: !state.obscurePassword));
  }

  void _onRoleSelected(AuthRoleSelected event, Emitter<AuthLoginState> emit) {
    emit(state.copyWith(selectedRole: event.roleIndex));
  }

  Future<void> _onLoginSubmitted(AuthLoginSubmitted event, Emitter<AuthLoginState> emit) async {
    emit(state.copyWith(isLoading: true));

    await Future.delayed(const Duration(seconds: 1)); // Simulate network

    if (event.email.isEmpty || event.password.isEmpty) {
      emit(state.copyWith(isLoading: false, errorMessage: 'Email dan password tidak boleh kosong'));
      return;
    }

    // Dummy logic: Success!
    emit(state.copyWith(isLoading: false, isSuccess: true, errorMessage: null));
  }
}
