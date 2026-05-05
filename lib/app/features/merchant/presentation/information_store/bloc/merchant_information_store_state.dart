part of 'merchant_information_store_bloc.dart';

class MerchantInformationStoreState {
  final String namaToko;
  final String kategoriToko;
  final String pic;
  final String whatsapp;
  final String kota;
  final String alamat;
  final bool isSaving;
  final bool isSaved;
  final bool hasLogo;
  final bool hasBanner;

  static const List<String> kategoriOptions = [
    'Makanan & Minuman',
    'Sembako',
    'Pakaian',
    'Jasa',
    'Lainnya',
  ];

  static const List<String> kotaOptions = [
    'Jakarta Pusat',
    'Jakarta Utara',
    'Jakarta Barat',
    'Jakarta Selatan',
    'Jakarta Timur',
    'Depok',
    'Bekasi',
    'Tangerang',
    'Bogor',
  ];

  const MerchantInformationStoreState({
    this.namaToko = 'Warunk Bu Siti',
    this.kategoriToko = 'Makanan & Minuman',
    this.pic = 'Siti Aminah',
    this.whatsapp = '0812 3456 7890',
    this.kota = 'Jakarta Timur',
    this.alamat = 'Jl. Raya Bekasi No. 45,\nKec. Matraman, Jakarta Timur',
    this.isSaving = false,
    this.isSaved = false,
    this.hasLogo = true,
    this.hasBanner = true,
  });

  bool get isValid =>
      namaToko.trim().isNotEmpty &&
      kategoriToko.isNotEmpty &&
      pic.trim().isNotEmpty &&
      whatsapp.trim().isNotEmpty &&
      kota.isNotEmpty &&
      alamat.trim().isNotEmpty;

  MerchantInformationStoreState copyWith({
    String? namaToko,
    String? kategoriToko,
    String? pic,
    String? whatsapp,
    String? kota,
    String? alamat,
    bool? isSaving,
    bool? isSaved,
    bool? hasLogo,
    bool? hasBanner,
  }) {
    return MerchantInformationStoreState(
      namaToko: namaToko ?? this.namaToko,
      kategoriToko: kategoriToko ?? this.kategoriToko,
      pic: pic ?? this.pic,
      whatsapp: whatsapp ?? this.whatsapp,
      kota: kota ?? this.kota,
      alamat: alamat ?? this.alamat,
      isSaving: isSaving ?? this.isSaving,
      isSaved: isSaved ?? this.isSaved,
      hasLogo: hasLogo ?? this.hasLogo,
      hasBanner: hasBanner ?? this.hasBanner,
    );
  }
}
