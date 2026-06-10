part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final String name;
  final String email;
  final String photoUrl;
  final bool isAuthenticated;
  final bool isLoading;
  final bool showSplash;
  final RoleEnum role;

  const AuthState({
    this.name = '',
    this.email = '',
    this.photoUrl = '',
    this.isAuthenticated = false,
    this.isLoading = false,
    this.showSplash = true,
    this.role = RoleEnum.customer,
  });

  AuthState copyWith({
    String? name,
    String? email,
    String? photoUrl,
    bool? isAuthenticated,
    bool? isLoading,
    RoleEnum? role,
  }) {
    return AuthState(
      name: name ?? this.name,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      isLoading: isLoading ?? this.isLoading,
      showSplash: false,
      role: role ?? this.role,
    );
  }

  @override
  List<Object?> get props => [
    name,
    email,
    photoUrl,
    isAuthenticated,
    isLoading,
    role,
  ];
}
