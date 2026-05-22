part of 'auth_reset_password_bloc.dart';

sealed class AuthResetPasswordEvent {}

class AuthResetPasswordEventCurrentPasswordChanged extends AuthResetPasswordEvent {
  final String value;
  AuthResetPasswordEventCurrentPasswordChanged(this.value);
}

class AuthResetPasswordEventNewPasswordChanged extends AuthResetPasswordEvent {
  final String value;
  AuthResetPasswordEventNewPasswordChanged(this.value);
}

class AuthResetPasswordEventConfirmPasswordChanged extends AuthResetPasswordEvent {
  final String value;
  AuthResetPasswordEventConfirmPasswordChanged(this.value);
}

class AuthResetPasswordEventSubmit extends AuthResetPasswordEvent {}

class AuthResetPasswordEventToggleObscureCurrent extends AuthResetPasswordEvent {}

class AuthResetPasswordEventToggleObscureNew extends AuthResetPasswordEvent {}

class AuthResetPasswordEventToggleObscureConfirm extends AuthResetPasswordEvent {}
