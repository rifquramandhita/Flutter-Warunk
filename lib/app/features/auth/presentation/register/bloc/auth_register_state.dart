import 'package:equatable/equatable.dart';

class AuthRegisterState extends Equatable {
  final int selectedRole;
  final bool obscurePassword;
  final bool agreeToTerms;
  final bool isLoading;
  final String? errorMessage;
  final bool isSuccess;

  const AuthRegisterState({
    this.selectedRole = 0,
    this.obscurePassword = true,
    this.agreeToTerms = true,
    this.isLoading = false,
    this.errorMessage,
    this.isSuccess = false,
  });

  AuthRegisterState copyWith({
    int? selectedRole,
    bool? obscurePassword,
    bool? agreeToTerms,
    bool? isLoading,
    String? errorMessage,
    bool? isSuccess,
  }) {
    return AuthRegisterState(
      selectedRole: selectedRole ?? this.selectedRole,
      obscurePassword: obscurePassword ?? this.obscurePassword,
      agreeToTerms: agreeToTerms ?? this.agreeToTerms,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      isSuccess: isSuccess ?? this.isSuccess,
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
  ];
}
