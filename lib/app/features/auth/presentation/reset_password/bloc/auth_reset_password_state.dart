part of 'auth_reset_password_bloc.dart';

class AuthResetPasswordState extends Equatable {
  final String currentPassword;
  final String newPassword;
  final String confirmPassword;
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;
  final bool obscureCurrent;
  final bool obscureNew;
  final bool obscureConfirm;

  const AuthResetPasswordState({
    this.currentPassword = '',
    this.newPassword = '',
    this.confirmPassword = '',
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
    this.obscureCurrent = true,
    this.obscureNew = true,
    this.obscureConfirm = true,
  });

  AuthResetPasswordState copyWith({
    String? currentPassword,
    String? newPassword,
    String? confirmPassword,
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
    bool? obscureCurrent,
    bool? obscureNew,
    bool? obscureConfirm,
  }) {
    return AuthResetPasswordState(
      currentPassword: currentPassword ?? this.currentPassword,
      newPassword: newPassword ?? this.newPassword,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage,
      obscureCurrent: obscureCurrent ?? this.obscureCurrent,
      obscureNew: obscureNew ?? this.obscureNew,
      obscureConfirm: obscureConfirm ?? this.obscureConfirm,
    );
  }

  @override
  List<Object?> get props => [
        currentPassword,
        newPassword,
        confirmPassword,
        isLoading,
        isSuccess,
        errorMessage,
        obscureCurrent,
        obscureNew,
        obscureConfirm,
      ];
}
