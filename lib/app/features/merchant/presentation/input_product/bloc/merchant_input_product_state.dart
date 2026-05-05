part of 'merchant_input_product_bloc.dart';

class MerchantInputProductState {
  final String nama;
  final String kategori;
  final String harga;
  final String stok;
  final String satuan;
  final String deskripsi;
  final bool tampilkan;
  final bool isSaving;
  final bool isSaved;
  final bool hasFoto;

  static const List<String> kategoriOptions = [
    'Minuman',
    'Makanan',
    'Sembako',
    'Lainnya',
  ];

  static const List<String> satuanOptions = [
    'porsi',
    'gelas',
    'bungkus',
    'pcs',
    'kg',
    'liter',
    'lusin',
  ];

  const MerchantInputProductState({
    this.nama = '',
    this.kategori = '',
    this.harga = '',
    this.stok = '',
    this.satuan = '',
    this.deskripsi = '',
    this.tampilkan = true,
    this.isSaving = false,
    this.isSaved = false,
    this.hasFoto = false,
  });

  bool get isValid =>
      nama.trim().isNotEmpty &&
      kategori.isNotEmpty &&
      (int.tryParse(harga) ?? 0) > 0 &&
      (int.tryParse(stok) ?? 0) >= 0;

  int get deskripsiLength => deskripsi.length;

  MerchantInputProductState copyWith({
    String? nama,
    String? kategori,
    String? harga,
    String? stok,
    String? satuan,
    String? deskripsi,
    bool? tampilkan,
    bool? isSaving,
    bool? isSaved,
    bool? hasFoto,
  }) =>
      MerchantInputProductState(
        nama: nama ?? this.nama,
        kategori: kategori ?? this.kategori,
        harga: harga ?? this.harga,
        stok: stok ?? this.stok,
        satuan: satuan ?? this.satuan,
        deskripsi: deskripsi ?? this.deskripsi,
        tampilkan: tampilkan ?? this.tampilkan,
        isSaving: isSaving ?? this.isSaving,
        isSaved: isSaved ?? this.isSaved,
        hasFoto: hasFoto ?? this.hasFoto,
      );
}
