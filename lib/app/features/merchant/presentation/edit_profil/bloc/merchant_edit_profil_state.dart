part of 'merchant_edit_profil_bloc.dart';

class MerchantEditProfilState {
  final String namaToko;
  final String kategoriToko;
  final String whatsapp;
  final String email;
  final bool isSaving;
  final bool isSaved;

  static const List<String> kategoriOptions = [
    'Warung Makan',
    'Warung Sembako',
    'Warung Kelontong',
    'Kedai Minuman',
    'Laundry',
    'Lainnya',
  ];

  const MerchantEditProfilState({
    this.namaToko = 'Warunk Bu Siti',
    this.kategoriToko = 'Warung Makan',
    this.whatsapp = '0812 3456 7890',
    this.email = 'warunk.busiti@gmail.com',
    this.isSaving = false,
    this.isSaved = false,
  });

  MerchantEditProfilState copyWith({
    String? namaToko,
    String? kategoriToko,
    String? whatsapp,
    String? email,
    bool? isSaving,
    bool? isSaved,
  }) =>
      MerchantEditProfilState(
        namaToko: namaToko ?? this.namaToko,
        kategoriToko: kategoriToko ?? this.kategoriToko,
        whatsapp: whatsapp ?? this.whatsapp,
        email: email ?? this.email,
        isSaving: isSaving ?? this.isSaving,
        isSaved: isSaved ?? this.isSaved,
      );
}
