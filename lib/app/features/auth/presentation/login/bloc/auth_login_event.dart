import 'package:warunk/core/enum/role.dart';

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
  final RoleEnum role;
  AuthRoleSelected(this.role);
}

class AuthLoginSubmitted extends AuthLoginEvent {}
