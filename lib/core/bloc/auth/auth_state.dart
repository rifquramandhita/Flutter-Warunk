part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final String name;
  final String email;
  final bool isAuthenticated;
  final bool isLoading;
  final bool showSplash;

  const AuthState({
    this.name = '',
    this.email = '',
    this.isAuthenticated = false,
    this.isLoading = false,
    this.showSplash = true,
  });

  AuthState copyWith({
    String? name,
    String? email,
    bool? isAuthenticated,
    bool? isLoading,
  }) {
    return AuthState(
      name: name ?? this.name,
      email: email ?? this.email,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      isLoading: isLoading ?? this.isLoading,
      showSplash: false,
    );
  }

  @override
  List<Object?> get props => [name, email, isAuthenticated, isLoading];
}
