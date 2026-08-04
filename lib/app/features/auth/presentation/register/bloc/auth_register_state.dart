import 'package:equatable/equatable.dart';

class AuthRegisterState extends Equatable {
  final int selectedRole;
  final bool obscurePassword;
  final bool agreeToTerms;
  final bool isLoading;
  final String? errorMessage;
  final bool isSuccess;

  final String name;
  final String email;
  final String phone;
  final String password;
  final String passwordConfirmation;
  final String merchantName;

  const AuthRegisterState({
    this.selectedRole = 0,
    this.obscurePassword = true,
    this.agreeToTerms = false,
    this.isLoading = false,
    this.errorMessage,
    this.isSuccess = false,
    this.name = '',
    this.email = '',
    this.phone = '',
    this.password = '',
    this.passwordConfirmation = '',
    this.merchantName = '',
  });

  AuthRegisterState copyWith({
    int? selectedRole,
    bool? obscurePassword,
    bool? agreeToTerms,
    bool? isLoading,
    String? errorMessage,
    bool? isSuccess,
    String? name,
    String? email,
    String? phone,
    String? password,
    String? passwordConfirmation,
    String? merchantName,
  }) {
    return AuthRegisterState(
      selectedRole: selectedRole ?? this.selectedRole,
      obscurePassword: obscurePassword ?? this.obscurePassword,
      agreeToTerms: agreeToTerms ?? this.agreeToTerms,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      isSuccess: isSuccess ?? false,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      passwordConfirmation: passwordConfirmation ?? this.passwordConfirmation,
      merchantName: merchantName ?? this.merchantName,
    );
  }

  @override
  List<Object?> get props => [
    selectedRole,
    obscurePassword,
    agreeToTerms,
    isLoading,
    errorMessage,
    isSuccess,
    name,
    email,
    phone,
    password,
    passwordConfirmation,
    merchantName,
  ];
}
