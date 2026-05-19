import 'package:equatable/equatable.dart';

class AuthLogoutState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final bool isSuccess;

  const AuthLogoutState({
    this.isLoading = false,
    this.errorMessage,
    this.isSuccess = false,
  });

  AuthLogoutState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? isSuccess,
  }) {
    return AuthLogoutState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      isSuccess: isLoading ?? false,
    );
  }

  @override
  List<Object?> get props => [isLoading, errorMessage, isSuccess];
}
