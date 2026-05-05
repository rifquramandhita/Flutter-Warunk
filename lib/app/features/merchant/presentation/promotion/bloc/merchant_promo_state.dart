part of 'merchant_promo_bloc.dart';

enum PromoType { diskon, potongan, diskonProduk }

enum PromoTabStatus { aktif, akanDatang, selesai }

class PromoItem {
  final String id;
  final PromoType type;
  final String title;
  final String value; // e.g. "10%" or "Rp5.000"
  final String minPurchase;
  final String dateRange;
  final int usedCount;
  final bool isActive;
  final PromoTabStatus tabStatus;

  const PromoItem({
    required this.id,
    required this.type,
    required this.title,
    required this.value,
    required this.minPurchase,
    required this.dateRange,
    required this.usedCount,
    required this.isActive,
    required this.tabStatus,
  });

  PromoItem copyWith({bool? isActive}) => PromoItem(
        id: id,
        type: type,
        title: title,
        value: value,
        minPurchase: minPurchase,
        dateRange: dateRange,
        usedCount: usedCount,
        isActive: isActive ?? this.isActive,
        tabStatus: tabStatus,
      );
}

class MerchantPromoState {
  final int selectedTab; // 0=Aktif, 1=Akan Datang, 2=Selesai
  final List<PromoItem> allPromos;

  const MerchantPromoState({
    this.selectedTab = 0,
    this.allPromos = const [
      PromoItem(
        id: '1',
        type: PromoType.diskon,
        title: 'Diskon 10% Semua Menu',
        value: '10%',
        minPurchase: 'Min. Pembelian Rp20.000',
        dateRange: '10 Mei - 20 Mei 2024',
        usedCount: 12,
        isActive: true,
        tabStatus: PromoTabStatus.aktif,
      ),
      PromoItem(
        id: '2',
        type: PromoType.potongan,
        title: 'Potongan ONGKIR',
        value: 'Rp5.000',
        minPurchase: 'Min. Pembelian Rp30.000',
        dateRange: '8 Mei - 31 Mei 2024',
        usedCount: 25,
        isActive: true,
        tabStatus: PromoTabStatus.aktif,
      ),
      PromoItem(
        id: '3',
        type: PromoType.diskonProduk,
        title: 'Es Teh Manis Diskon 20%',
        value: '20%',
        minPurchase: '',
        dateRange: '5 Mei - 31 Mei 2024',
        usedCount: 18,
        isActive: false,
        tabStatus: PromoTabStatus.aktif,
      ),
      PromoItem(
        id: '4',
        type: PromoType.diskon,
        title: 'Flash Sale Malam Minggu',
        value: '15%',
        minPurchase: 'Min. Pembelian Rp25.000',
        dateRange: '1 Jun - 7 Jun 2024',
        usedCount: 0,
        isActive: false,
        tabStatus: PromoTabStatus.akanDatang,
      ),
      PromoItem(
        id: '5',
        type: PromoType.potongan,
        title: 'Promo Lebaran Spesial',
        value: 'Rp10.000',
        minPurchase: 'Min. Pembelian Rp50.000',
        dateRange: '1 Apr - 14 Apr 2024',
        usedCount: 48,
        isActive: false,
        tabStatus: PromoTabStatus.selesai,
      ),
    ],
  });

  List<PromoItem> get filteredPromos {
    final tabStatus = PromoTabStatus.values[selectedTab];
    return allPromos.where((p) => p.tabStatus == tabStatus).toList();
  }

  MerchantPromoState copyWith({int? selectedTab, List<PromoItem>? allPromos}) =>
      MerchantPromoState(
        selectedTab: selectedTab ?? this.selectedTab,
        allPromos: allPromos ?? this.allPromos,
      );
}
