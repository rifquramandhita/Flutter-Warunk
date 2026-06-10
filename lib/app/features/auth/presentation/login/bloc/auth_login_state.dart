import 'package:equatable/equatable.dart';
import 'package:warunk/core/enum/role.dart';

class AuthLoginState extends Equatable {
  final String email;
  final String password;
  final bool obscurePassword;
  final RoleEnum role;
  final bool isLoading;
  final String? errorMessage;

  const AuthLoginState({
    this.email = '',
    this.password = '',
    this.obscurePassword = true,
    this.role = RoleEnum.customer,
    this.isLoading = false,
    this.errorMessage,
  });

  AuthLoginState copyWith({
    String? email,
    String? password,
    bool? obscurePassword,
    RoleEnum? role,
    bool? isLoading,
    String? errorMessage,
  }) {
    return AuthLoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      obscurePassword: obscurePassword ?? this.obscurePassword,
      role: role ?? this.role,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    email,
    password,
    obscurePassword,
    role,
    isLoading,
    errorMessage,
  ];
}
