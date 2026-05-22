part of 'merchant_profil_bloc.dart';

class MerchantProfilState extends Equatable {
  final String name;
  final String email;
  final String phone;
  final MerchantMerchantEntity? merchant;
  final bool isLoading;
  final String? errorMessage;

  const MerchantProfilState({
    this.name = '',
    this.email = '',
    this.phone = '',
    this.merchant,
    this.isLoading = false,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [
    name,
    email,
    phone,
    merchant,
    isLoading,
    errorMessage,
  ];

  MerchantProfilState copyWith({
    String? name,
    String? email,
    String? phone,
    MerchantMerchantEntity? merchant,
    bool? isLoading,
    String? errorMessage,
  }) => MerchantProfilState(
    name: name ?? this.name,
    email: email ?? this.email,
    phone: phone ?? this.phone,
    merchant: merchant ?? this.merchant,
    isLoading: isLoading ?? this.isLoading,
    errorMessage: errorMessage,
  );
}
