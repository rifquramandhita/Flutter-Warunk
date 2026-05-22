import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/auth/domain/use_case/auth_forgot_password_use_case.dart';
import 'package:warunk/app/features/auth/presentation/reset_password/bloc/auth_reset_password_event.dart';
import 'package:warunk/app/features/auth/presentation/reset_password/bloc/auth_reset_password_state.dart';
import 'package:warunk/core/network/data_state.dart';

class AuthResetPasswordBloc
    extends Bloc<AuthResetPasswordEvent, AuthResetPasswordState> {
  final AuthForgotPasswordUseCase _useCase;

  AuthResetPasswordBloc({required AuthForgotPasswordUseCase useCase})
    : _useCase = useCase,
      super(const AuthResetPasswordState()) {
    on<AuthResetEmailChanged>(_onEmailChanged);
    on<AuthResetPasswordSubmitted>(_onSubmitted);
  }

  void _onEmailChanged(
    AuthResetEmailChanged event,
    Emitter<AuthResetPasswordState> emit,
  ) {
    emit(state.copyWith(email: event.email, errorMessage: null, successMessage: null));
  }

  Future<void> _onSubmitted(
    AuthResetPasswordSubmitted event,
    Emitter<AuthResetPasswordState> emit,
  ) async {
    if (state.email.isEmpty) {
      emit(state.copyWith(errorMessage: 'Email tidak boleh kosong'));
      emit(state.copyWith(errorMessage: null));
      return;
    }

    emit(state.copyWith(isLoading: true, errorMessage: null, successMessage: null));

    final result = await _useCase(email: state.email);

    if (result is SuccessState) {
      emit(state.copyWith(
        isLoading: false,
        successMessage: 'Link reset password telah dikirim ke email Anda',
      ));
      emit(state.copyWith(successMessage: null));
    } else if (result is ErrorState) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: result.message,
      ));
      emit(state.copyWith(errorMessage: null));
    }
  }
}
