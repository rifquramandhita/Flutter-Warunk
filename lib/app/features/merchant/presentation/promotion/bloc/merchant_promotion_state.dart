part of 'merchant_promotion_bloc.dart';

enum PromoTabStatus { semua, aktif, akanDatang, selesai }

class MerchantPromotionState extends Equatable {
  final int selectedTab; // 0=Semua, 1=Aktif, 2=Akan Datang, 3=Selesai
  final List<MerchantPromotionEntity> allPromos;
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;

  const MerchantPromotionState({
    this.selectedTab = 0,
    this.allPromos = const [],
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
  });

  List<MerchantPromotionEntity> get filteredPromos {
    final tabStatus = PromoTabStatus.values[selectedTab];
    if (tabStatus == PromoTabStatus.semua) return allPromos;

    final now = DateTime.now();

    return allPromos.where((p) {
      final isAkanDatang = p.datetimeStart.isAfter(now);
      final isSelesai = p.datetimeEnd.isBefore(now);
      
      PromoTabStatus currentStatus = PromoTabStatus.aktif;
      if (isAkanDatang) currentStatus = PromoTabStatus.akanDatang;
      if (isSelesai) currentStatus = PromoTabStatus.selesai;

      return currentStatus == tabStatus;
    }).toList();
  }

  @override
  List<Object?> get props => [selectedTab, allPromos, isLoading, isSuccess, errorMessage];

  MerchantPromotionState copyWith({
    int? selectedTab,
    List<MerchantPromotionEntity>? allPromos,
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
  }) =>
      MerchantPromotionState(
        selectedTab: selectedTab ?? this.selectedTab,
        allPromos: allPromos ?? this.allPromos,
        isLoading: isLoading ?? this.isLoading,
        isSuccess: isSuccess ?? false, // reset isSuccess to false on copy unless explicitly passed true
        errorMessage: errorMessage, // without fallback so it can be reset to empty
      );
}
