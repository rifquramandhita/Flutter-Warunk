part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final String name;
  final String email;
  final bool isAuthenticated;
  final bool isLoading; // true selama AuthEventCheck belum selesai

  const AuthState({
    this.name = '',
    this.email = '',
    this.isAuthenticated = false,
    this.isLoading = true, // default true: belum cek storage
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
    );
  }

  @override
  List<Object?> get props => [name, email, isAuthenticated, isLoading];
}
