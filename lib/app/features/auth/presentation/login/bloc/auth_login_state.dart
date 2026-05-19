import 'package:equatable/equatable.dart';

class AuthLoginState extends Equatable {
  final String email;
  final String password;
  final bool obscurePassword;
  final int selectedRole;
  final bool isLoading;
  final String? errorMessage;

  const AuthLoginState({
    this.email = '',
    this.password = '',
    this.obscurePassword = true,
    this.selectedRole = 0,
    this.isLoading = false,
    this.errorMessage,
  });

  AuthLoginState copyWith({
    String? email,
    String? password,
    bool? obscurePassword,
    int? selectedRole,
    bool? isLoading,
    String? errorMessage,
  }) {
    return AuthLoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      obscurePassword: obscurePassword ?? this.obscurePassword,
      selectedRole: selectedRole ?? this.selectedRole,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    email,
    password,
    obscurePassword,
    selectedRole,
    isLoading,
    errorMessage,
  ];
}
