part of 'merchant_input_promotion_bloc.dart';

class MerchantInputPromotionState extends Equatable {
  final String? promoId;
  final String tipe;
  final String tipeDiskon;
  final String nama;
  final String nilai;
  final String minBeli;
  final DateTime? mulai;
  final DateTime? selesai;
  final String kuota;
  final String kode;
  final bool isLoading;
  final bool isDetailLoaded;
  final bool isSuccess;
  final String? errorMessage;
  final List<MerchantProductEntity> products;
  final bool isProductsLoading;
  final List<String?> selectedProductIds;
  final List<bool> selectedProductAllVariants;
  final List<List<String>> selectedProductVariantIds;
  final String targetPengguna;
  final bool isShow;
  final bool isUnlimitedUse;

  static const List<String> tipeOptions = ['order', 'product', 'shipping'];

  static const List<String> tipeDiskonOptions = ['fixed', 'percentage'];

  static const List<String> targetPenggunaOptions = ['all_user', 'new_user'];

  const MerchantInputPromotionState({
    this.promoId,
    this.tipe = '',
    this.tipeDiskon = '',
    this.nama = '',
    this.nilai = '',
    this.minBeli = '',
    this.mulai,
    this.selesai,
    this.kuota = '',
    this.kode = '',
    this.isLoading = false,
    this.isDetailLoaded = false,
    this.isSuccess = false,
    this.errorMessage,
    this.products = const [],
    this.isProductsLoading = false,
    this.selectedProductIds = const [],
    this.selectedProductAllVariants = const [],
    this.selectedProductVariantIds = const [],
    this.targetPengguna = 'all_user',
    this.isShow = true,
    this.isUnlimitedUse = true,
  });

  /// Satuan suffix ditentukan oleh tipe
  String get nilaiSuffix {
    if (tipeDiskon == 'percentage') return '%';
    return '';
  }

  String get nilaiPrefix {
    if (tipeDiskon == 'fixed') return 'Rp ';
    return '';
  }

  String get nilaiLabel {
    if (tipe == 'shipping') return 'Potongan Ongkir';
    if (tipeDiskon == 'percentage') return 'Diskon';
    return 'Potongan';
  }

  bool get isValid =>
      tipe.isNotEmpty &&
      tipeDiskon.isNotEmpty &&
      nama.trim().isNotEmpty &&
      nilai.isNotEmpty &&
      mulai != null &&
      selesai != null &&
      (selesai!.isAfter(mulai!) || selesai!.isAtSameMomentAs(mulai!)) &&
      (tipe != 'product' ||
          selectedProductIds.where((id) => id != null).isNotEmpty) &&
      (isUnlimitedUse || kuota.isNotEmpty) &&
      (isShow || kode.trim().isNotEmpty);

  MerchantInputPromotionState copyWith({
    String? promoId,
    String? tipe,
    String? tipeDiskon,
    String? nama,
    String? nilai,
    String? minBeli,
    DateTime? mulai,
    DateTime? selesai,
    String? kuota,
    String? kode,
    bool? isLoading,
    bool? isDetailLoaded,
    bool? isSuccess,
    String? errorMessage,
    List<MerchantProductEntity>? products,
    bool? isProductsLoading,
    List<String?>? selectedProductIds,
    List<bool>? selectedProductAllVariants,
    List<List<String>>? selectedProductVariantIds,
    bool clearMulai = false,
    bool clearSelesai = false,
    String? targetPengguna,
    bool? isShow,
    bool? isUnlimitedUse,
  }) => MerchantInputPromotionState(
    promoId: promoId ?? this.promoId,
    tipe: tipe ?? this.tipe,
    tipeDiskon: tipeDiskon ?? this.tipeDiskon,
    nama: nama ?? this.nama,
    nilai: nilai ?? this.nilai,
    minBeli: minBeli ?? this.minBeli,
    mulai: clearMulai ? null : (mulai ?? this.mulai),
    selesai: clearSelesai ? null : (selesai ?? this.selesai),
    kuota: kuota ?? this.kuota,
    kode: kode ?? this.kode,
    isLoading: isLoading ?? this.isLoading,
    isDetailLoaded: isDetailLoaded ?? this.isDetailLoaded,
    isSuccess: isSuccess ?? false,
    errorMessage: errorMessage,
    products: products ?? this.products,
    isProductsLoading: isProductsLoading ?? this.isProductsLoading,
    selectedProductIds: selectedProductIds ?? this.selectedProductIds,
    selectedProductAllVariants: selectedProductAllVariants ?? this.selectedProductAllVariants,
    selectedProductVariantIds: selectedProductVariantIds ?? this.selectedProductVariantIds,
    targetPengguna: targetPengguna ?? this.targetPengguna,
    isShow: isShow ?? this.isShow,
    isUnlimitedUse: isUnlimitedUse ?? this.isUnlimitedUse,
  );

  @override
  List<Object?> get props => [
    promoId,
    tipe,
    tipeDiskon,
    nama,
    nilai,
    minBeli,
    mulai,
    selesai,
    kuota,
    kode,
    isLoading,
    isDetailLoaded,
    isSuccess,
    errorMessage,
    products,
    isProductsLoading,
    selectedProductIds,
    selectedProductAllVariants,
    selectedProductVariantIds,
    targetPengguna,
    isShow,
    isUnlimitedUse,
  ];
}
