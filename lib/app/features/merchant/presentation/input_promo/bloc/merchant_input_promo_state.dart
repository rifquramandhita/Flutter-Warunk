part of 'merchant_input_promo_bloc.dart';

class MerchantInputPromoState {
  final String tipe;
  final String nama;
  final String nilai; // angka diskon / nominal potongan
  final String minBeli;
  final DateTime? mulai;
  final DateTime? selesai;
  final String kuota;
  final bool isSaving;
  final bool isSaved;

  static const List<String> tipeOptions = [
    'Diskon Persen (Semua Produk)',
    'Potongan Harga (Semua Produk)',
    'Diskon Persen (Produk Tertentu)',
    'Potongan Ongkir',
  ];

  const MerchantInputPromoState({
    this.tipe = '',
    this.nama = '',
    this.nilai = '',
    this.minBeli = '',
    this.mulai,
    this.selesai,
    this.kuota = '',
    this.isSaving = false,
    this.isSaved = false,
  });

  /// Satuan suffix ditentukan oleh tipe
  String get nilaiSuffix {
    if (tipe.contains('Persen')) return '%';
    return '';
  }

  String get nilaiPrefix {
    if (tipe.contains('Potongan')) return 'Rp ';
    return '';
  }

  String get nilaiLabel {
    if (tipe.contains('Ongkir')) return 'Potongan Ongkir';
    if (tipe.contains('Persen')) return 'Diskon';
    return 'Potongan';
  }

  bool get isValid =>
      tipe.isNotEmpty &&
      nama.trim().isNotEmpty &&
      nilai.isNotEmpty &&
      mulai != null &&
      selesai != null &&
      (selesai!.isAfter(mulai!) || selesai!.isAtSameMomentAs(mulai!));

  MerchantInputPromoState copyWith({
    String? tipe,
    String? nama,
    String? nilai,
    String? minBeli,
    DateTime? mulai,
    DateTime? selesai,
    String? kuota,
    bool? isSaving,
    bool? isSaved,
    bool clearMulai = false,
    bool clearSelesai = false,
  }) =>
      MerchantInputPromoState(
        tipe: tipe ?? this.tipe,
        nama: nama ?? this.nama,
        nilai: nilai ?? this.nilai,
        minBeli: minBeli ?? this.minBeli,
        mulai: clearMulai ? null : (mulai ?? this.mulai),
        selesai: clearSelesai ? null : (selesai ?? this.selesai),
        kuota: kuota ?? this.kuota,
        isSaving: isSaving ?? this.isSaving,
        isSaved: isSaved ?? this.isSaved,
      );
}
