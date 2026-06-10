import 'package:equatable/equatable.dart';

class AuthLoginState extends Equatable {
  final String email;
  final String password;
  final bool obscurePassword;
  final bool isMerchant;
  final bool isLoading;
  final String? errorMessage;

  const AuthLoginState({
    this.email = '',
    this.password = '',
    this.obscurePassword = true,
    this.isMerchant = false,
    this.isLoading = false,
    this.errorMessage,
  });

  AuthLoginState copyWith({
    String? email,
    String? password,
    bool? obscurePassword,
    bool? isMerchant,
    bool? isLoading,
    String? errorMessage,
  }) {
    return AuthLoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      obscurePassword: obscurePassword ?? this.obscurePassword,
      isMerchant: isMerchant ?? this.isMerchant,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    email,
    password,
    obscurePassword,
    isMerchant,
    isLoading,
    errorMessage,
  ];
}
