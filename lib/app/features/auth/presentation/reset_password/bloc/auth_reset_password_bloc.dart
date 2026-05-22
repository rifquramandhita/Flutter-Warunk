import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/auth/domain/entity/reset_password.dart';
import 'package:warunk/app/features/auth/domain/use_case/auth_reset_password_use_case.dart';
import 'package:warunk/core/network/data_state.dart';

part 'auth_reset_password_event.dart';
part 'auth_reset_password_state.dart';

class AuthResetPasswordBloc
    extends Bloc<AuthResetPasswordEvent, AuthResetPasswordState> {
  final AuthResetPasswordUseCase _useCase;

  AuthResetPasswordBloc({required AuthResetPasswordUseCase useCase})
    : _useCase = useCase,
      super(const AuthResetPasswordState()) {
    on<AuthResetPasswordEventCurrentPasswordChanged>(_onCurrentPasswordChanged);
    on<AuthResetPasswordEventNewPasswordChanged>(_onNewPasswordChanged);
    on<AuthResetPasswordEventConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<AuthResetPasswordEventSubmit>(_onSubmit);
    on<AuthResetPasswordEventToggleObscureCurrent>(_onToggleObscureCurrent);
    on<AuthResetPasswordEventToggleObscureNew>(_onToggleObscureNew);
    on<AuthResetPasswordEventToggleObscureConfirm>(_onToggleObscureConfirm);
  }

  void _onCurrentPasswordChanged(
    AuthResetPasswordEventCurrentPasswordChanged event,
    Emitter<AuthResetPasswordState> emit,
  ) {
    emit(state.copyWith(currentPassword: event.value));
  }

  void _onNewPasswordChanged(
    AuthResetPasswordEventNewPasswordChanged event,
    Emitter<AuthResetPasswordState> emit,
  ) {
    emit(state.copyWith(newPassword: event.value));
  }

  void _onConfirmPasswordChanged(
    AuthResetPasswordEventConfirmPasswordChanged event,
    Emitter<AuthResetPasswordState> emit,
  ) {
    emit(state.copyWith(confirmPassword: event.value));
  }

  void _onToggleObscureCurrent(
    AuthResetPasswordEventToggleObscureCurrent event,
    Emitter<AuthResetPasswordState> emit,
  ) {
    emit(state.copyWith(obscureCurrent: !state.obscureCurrent));
  }

  void _onToggleObscureNew(
    AuthResetPasswordEventToggleObscureNew event,
    Emitter<AuthResetPasswordState> emit,
  ) {
    emit(state.copyWith(obscureNew: !state.obscureNew));
  }

  void _onToggleObscureConfirm(
    AuthResetPasswordEventToggleObscureConfirm event,
    Emitter<AuthResetPasswordState> emit,
  ) {
    emit(state.copyWith(obscureConfirm: !state.obscureConfirm));
  }

  Future<void> _onSubmit(
    AuthResetPasswordEventSubmit event,
    Emitter<AuthResetPasswordState> emit,
  ) async {
    if (state.currentPassword.isEmpty ||
        state.newPassword.isEmpty ||
        state.confirmPassword.isEmpty) {
      emit(state.copyWith(errorMessage: 'Semua field harus diisi'));
      return;
    }

    if (state.newPassword != state.confirmPassword) {
      emit(state.copyWith(errorMessage: 'Konfirmasi password tidak cocok'));
      return;
    }

    emit(state.copyWith(isLoading: true));

    final param = ResetPasswordParam(
      currentPassword: state.currentPassword,
      password: state.newPassword,
      passwordConfirmation: state.confirmPassword,
    );

    final response = await _useCase.call(param: param);

    if (response is SuccessState) {
      emit(state.copyWith(isSuccess: true));
    } else {
      emit(state.copyWith(errorMessage: response.message));
    }

    emit(state.copyWith(isLoading: false));
  }
}
