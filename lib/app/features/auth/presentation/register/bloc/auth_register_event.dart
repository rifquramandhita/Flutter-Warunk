abstract class AuthRegisterEvent {}

class AuthRegisterEventRoleSelected extends AuthRegisterEvent {
  final int roleIndex; // 0 = Customer, 1 = Merchant
  AuthRegisterEventRoleSelected(this.roleIndex);
}

class AuthRegisterEventObscurePasswordToggled extends AuthRegisterEvent {}

class AuthRegisterEventTermsToggled extends AuthRegisterEvent {
  final bool agreed;
  AuthRegisterEventTermsToggled(this.agreed);
}

class AuthRegisterEventNameChanged extends AuthRegisterEvent {
  final String name;
  AuthRegisterEventNameChanged(this.name);
}

class AuthRegisterEventEmailChanged extends AuthRegisterEvent {
  final String email;
  AuthRegisterEventEmailChanged(this.email);
}

class AuthRegisterEventPhoneChanged extends AuthRegisterEvent {
  final String phone;
  AuthRegisterEventPhoneChanged(this.phone);
}

class AuthRegisterEventPasswordChanged extends AuthRegisterEvent {
  final String password;
  AuthRegisterEventPasswordChanged(this.password);
}

class AuthRegisterEventPasswordConfirmationChanged extends AuthRegisterEvent {
  final String passwordConfirmation;
  AuthRegisterEventPasswordConfirmationChanged(this.passwordConfirmation);
}

class AuthRegisterEventSend extends AuthRegisterEvent {}
