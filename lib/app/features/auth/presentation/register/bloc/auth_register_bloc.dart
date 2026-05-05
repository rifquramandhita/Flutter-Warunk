import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_register_event.dart';
import 'auth_register_state.dart';

class AuthRegisterBloc extends Bloc<AuthRegisterEvent, AuthRegisterState> {
  AuthRegisterBloc() : super(const AuthRegisterState()) {
    on<AuthRegisterRoleSelected>(_onRoleSelected);
    on<AuthRegisterObscurePasswordToggled>(_onObscurePasswordToggled);
    on<AuthRegisterTermsToggled>(_onTermsToggled);
    on<AuthRegisterSubmitted>(_onSubmitted);
  }

  void _onRoleSelected(AuthRegisterRoleSelected event, Emitter<AuthRegisterState> emit) {
    emit(state.copyWith(selectedRole: event.roleIndex));
  }

  void _onObscurePasswordToggled(AuthRegisterObscurePasswordToggled event, Emitter<AuthRegisterState> emit) {
    emit(state.copyWith(obscurePassword: !state.obscurePassword));
  }

  void _onTermsToggled(AuthRegisterTermsToggled event, Emitter<AuthRegisterState> emit) {
    emit(state.copyWith(agreeToTerms: event.agreed));
  }

  Future<void> _onSubmitted(AuthRegisterSubmitted event, Emitter<AuthRegisterState> emit) async {
    emit(state.copyWith(isLoading: true));

    await Future.delayed(const Duration(seconds: 1)); // Simulate network

    if (event.name.isEmpty || event.email.isEmpty || event.phone.isEmpty || event.password.isEmpty) {
      emit(state.copyWith(isLoading: false, errorMessage: 'Semua field harus diisi'));
      return;
    }

    if (!state.agreeToTerms) {
      emit(state.copyWith(isLoading: false, errorMessage: 'Anda harus menyetujui Syarat & Ketentuan'));
      return;
    }

    emit(state.copyWith(isLoading: false, isSuccess: true, errorMessage: null));
  }
}
