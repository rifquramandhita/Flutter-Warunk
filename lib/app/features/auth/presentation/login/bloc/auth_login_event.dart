
abstract class AuthLoginEvent {}

class AuthObscurePasswordToggled extends AuthLoginEvent {}

class AuthRoleSelected extends AuthLoginEvent {
  final int roleIndex; // 0 = Customer, 1 = Merchant
  AuthRoleSelected(this.roleIndex);
}

class AuthLoginSubmitted extends AuthLoginEvent {
  final String email;
  final String password;
  AuthLoginSubmitted(this.email, this.password);
}
