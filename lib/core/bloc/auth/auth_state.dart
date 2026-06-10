part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final String name;
  final String email;
  final String photoUrl;
  final bool isAuthenticated;
  final bool isLoading;
  final bool showSplash;
  final bool isMerchant;

  const AuthState({
    this.name = '',
    this.email = '',
    this.photoUrl = '',
    this.isAuthenticated = false,
    this.isLoading = false,
    this.showSplash = true,
    this.isMerchant = false,
  });

  AuthState copyWith({
    String? name,
    String? email,
    String? photoUrl,
    bool? isAuthenticated,
    bool? isLoading,
    bool? isMerchant,
  }) {
    return AuthState(
      name: name ?? this.name,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      isLoading: isLoading ?? this.isLoading,
      showSplash: false,
      isMerchant: isMerchant ?? this.isMerchant,
    );
  }

  @override
  List<Object?> get props => [
    name,
    email,
    photoUrl,
    isAuthenticated,
    isLoading,
    isMerchant,
  ];
}
