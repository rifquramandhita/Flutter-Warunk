import 'package:equatable/equatable.dart';

class AuthLoginState extends Equatable {
  final bool obscurePassword;
  final int selectedRole;
  final bool isLoading;
  final String? errorMessage;
  final bool isSuccess;

  const AuthLoginState({
    this.obscurePassword = true,
    this.selectedRole = 0,
    this.isLoading = false,
    this.errorMessage,
    this.isSuccess = false,
  });

  AuthLoginState copyWith({
    bool? obscurePassword,
    int? selectedRole,
    bool? isLoading,
    String? errorMessage,
    bool? isSuccess,
  }) {
    return AuthLoginState(
      obscurePassword: obscurePassword ?? this.obscurePassword,
      selectedRole: selectedRole ?? this.selectedRole,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }

  @override
  List<Object?> get props => [
    obscurePassword,
    selectedRole,
    isLoading,
    errorMessage,
    isSuccess,
  ];
}
