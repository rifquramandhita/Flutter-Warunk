part of 'merchant_profil_bloc.dart';

class MerchantProfilState {
  final String storeName;
  final String ownerName;
  final String email;
  final String whatsapp;
  final String language;
  final bool isLoggingOut;

  const MerchantProfilState({
    this.storeName = 'Warunk Bu Siti',
    this.ownerName = 'Siti Aminah',
    this.email = 'warunk.busiti@gmail.com',
    this.whatsapp = '0812 3456 7890',
    this.language = 'Bahasa Indonesia',
    this.isLoggingOut = false,
  });

  MerchantProfilState copyWith({bool? isLoggingOut}) => MerchantProfilState(
        storeName: storeName,
        ownerName: ownerName,
        email: email,
        whatsapp: whatsapp,
        language: language,
        isLoggingOut: isLoggingOut ?? this.isLoggingOut,
      );
}
