part of 'merchant_promotion_bloc.dart';

enum PromoTabStatus { semua, aktif, akanDatang, selesai }

class MerchantPromotionState extends Equatable {
  final int selectedTab; // 0=Semua, 1=Aktif, 2=Akan Datang, 3=Selesai
  final List<MerchantPromotionEntity> allPromos;
  final List<MerchantPromotionNationalEntity> nationalPromos;
  final bool isLoading;
  final bool isSuccess;
  final bool isJoinSuccess;
  final String? joinUrl;
  final String? errorMessage;

  const MerchantPromotionState({
    this.selectedTab = 0,
    this.allPromos = const [],
    this.nationalPromos = const [],
    this.isLoading = false,
    this.isSuccess = false,
    this.isJoinSuccess = false,
    this.joinUrl,
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
  List<Object?> get props => [selectedTab, allPromos, nationalPromos, isLoading, isSuccess, isJoinSuccess, joinUrl, errorMessage];

  MerchantPromotionState copyWith({
    int? selectedTab,
    List<MerchantPromotionEntity>? allPromos,
    List<MerchantPromotionNationalEntity>? nationalPromos,
    bool? isLoading,
    bool? isSuccess,
    bool? isJoinSuccess,
    String? joinUrl,
    String? errorMessage,
  }) =>
      MerchantPromotionState(
        selectedTab: selectedTab ?? this.selectedTab,
        allPromos: allPromos ?? this.allPromos,
        nationalPromos: nationalPromos ?? this.nationalPromos,
        isLoading: isLoading ?? this.isLoading,
        isSuccess: isSuccess ?? false,
        isJoinSuccess: isJoinSuccess ?? false,
        joinUrl: joinUrl,
        errorMessage: errorMessage,
      );
}
