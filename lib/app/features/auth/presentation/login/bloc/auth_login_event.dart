abstract class AuthLoginEvent {}

class AuthEmailChanged extends AuthLoginEvent {
  final String email;
  AuthEmailChanged(this.email);
}

class AuthPasswordChanged extends AuthLoginEvent {
  final String password;
  AuthPasswordChanged(this.password);
}

class AuthObscurePasswordToggled extends AuthLoginEvent {}

class AuthRoleSelected extends AuthLoginEvent {
  final bool isMerchant;
  AuthRoleSelected(this.isMerchant);
}

class AuthLoginSubmitted extends AuthLoginEvent {}
