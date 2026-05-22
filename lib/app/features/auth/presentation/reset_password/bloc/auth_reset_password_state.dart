import 'package:equatable/equatable.dart';

class AuthResetPasswordState extends Equatable {
  final String email;
  final bool isLoading;
  final String? errorMessage;
  final String? successMessage;

  const AuthResetPasswordState({
    this.email = '',
    this.isLoading = false,
    this.errorMessage,
    this.successMessage,
  });

  AuthResetPasswordState copyWith({
    String? email,
    bool? isLoading,
    String? errorMessage,
    String? successMessage,
  }) {
    return AuthResetPasswordState(
      email: email ?? this.email,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      successMessage: successMessage,
    );
  }

  @override
  List<Object?> get props => [
        email,
        isLoading,
        errorMessage,
        successMessage,
      ];
}
