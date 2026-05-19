
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
  final int roleIndex; // 0 = Customer, 1 = Merchant
  AuthRoleSelected(this.roleIndex);
}

class AuthLoginSubmitted extends AuthLoginEvent {}
