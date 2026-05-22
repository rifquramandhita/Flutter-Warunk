abstract class AuthResetPasswordEvent {}

class AuthResetEmailChanged extends AuthResetPasswordEvent {
  final String email;
  AuthResetEmailChanged(this.email);
}

class AuthResetPasswordSubmitted extends AuthResetPasswordEvent {}
