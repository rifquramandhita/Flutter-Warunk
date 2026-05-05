
abstract class AuthRegisterEvent {}

class AuthRegisterRoleSelected extends AuthRegisterEvent {
  final int roleIndex; // 0 = Customer, 1 = Merchant
  AuthRegisterRoleSelected(this.roleIndex);
}

class AuthRegisterObscurePasswordToggled extends AuthRegisterEvent {}

class AuthRegisterTermsToggled extends AuthRegisterEvent {
  final bool agreed;
  AuthRegisterTermsToggled(this.agreed);
}

class AuthRegisterSubmitted extends AuthRegisterEvent {
  final String name;
  final String email;
  final String phone;
  final String password;
  AuthRegisterSubmitted(this.name, this.email, this.phone, this.password);
}
