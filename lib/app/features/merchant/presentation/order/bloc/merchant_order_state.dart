part of 'merchant_order_bloc.dart';

enum MerchantOrderStatus { baru, diproses, selesai, dibatalkan }

enum MerchantPickupType { ambilDiTempat, diantar }

class MerchantOrderItem {
  final String orderId;
  final String customerName;
  final String dateTime;
  final int itemCount;
  final int total;
  final MerchantOrderStatus status;
  final MerchantPickupType pickupType;
  final String storeName;

  const MerchantOrderItem({
    required this.orderId,
    required this.customerName,
    required this.dateTime,
    required this.itemCount,
    required this.total,
    required this.status,
    required this.pickupType,
    required this.storeName,
  });
}

class MerchantOrderState {
  final int selectedTab;
  final List<MerchantOrderItem> allOrders;

  const MerchantOrderState({
    this.selectedTab = 0,
    this.allOrders = const [
      // ── Baru ──────────────────────────────────────────────────────────────
      MerchantOrderItem(
        orderId: '#WRK-240515-0015',
        customerName: 'Budi Santoso',
        dateTime: '15 Mei 2024 • 10:28',
        itemCount: 3,
        total: 27000,
        status: MerchantOrderStatus.baru,
        pickupType: MerchantPickupType.ambilDiTempat,
        storeName: 'Warunk Bu Siti',
      ),
      MerchantOrderItem(
        orderId: '#WRK-240515-0016',
        customerName: 'Rina Aprilia',
        dateTime: '15 Mei 2024 • 10:32',
        itemCount: 2,
        total: 16000,
        status: MerchantOrderStatus.baru,
        pickupType: MerchantPickupType.ambilDiTempat,
        storeName: 'Warunk Bu Siti',
      ),
      MerchantOrderItem(
        orderId: '#WRK-240515-0017',
        customerName: 'Dewi Lestari',
        dateTime: '15 Mei 2024 • 10:35',
        itemCount: 4,
        total: 38000,
        status: MerchantOrderStatus.baru,
        pickupType: MerchantPickupType.ambilDiTempat,
        storeName: 'Warunk Bu Siti',
      ),
      MerchantOrderItem(
        orderId: '#WRK-240515-0018',
        customerName: 'Andi Pratama',
        dateTime: '15 Mei 2024 • 10:40',
        itemCount: 1,
        total: 8000,
        status: MerchantOrderStatus.baru,
        pickupType: MerchantPickupType.ambilDiTempat,
        storeName: 'Warunk Bu Siti',
      ),
      // ── Diproses ───────────────────────────────────────────────────────────
      MerchantOrderItem(
        orderId: '#WRK-240515-0012',
        customerName: 'Siti Aminah',
        dateTime: '15 Mei 2024 • 09:58',
        itemCount: 2,
        total: 28000,
        status: MerchantOrderStatus.diproses,
        pickupType: MerchantPickupType.diantar,
        storeName: 'Warunk Bu Siti',
      ),
      MerchantOrderItem(
        orderId: '#WRK-240515-0013',
        customerName: 'Tono Wijaya',
        dateTime: '15 Mei 2024 • 10:05',
        itemCount: 5,
        total: 55000,
        status: MerchantOrderStatus.diproses,
        pickupType: MerchantPickupType.ambilDiTempat,
        storeName: 'Warunk Bu Siti',
      ),
      // ── Selesai ────────────────────────────────────────────────────────────
      MerchantOrderItem(
        orderId: '#WRK-240515-0010',
        customerName: 'Andi Pratama',
        dateTime: '15 Mei 2024 • 09:21',
        itemCount: 3,
        total: 45000,
        status: MerchantOrderStatus.selesai,
        pickupType: MerchantPickupType.ambilDiTempat,
        storeName: 'Warunk Bu Siti',
      ),
      // ── Dibatalkan ─────────────────────────────────────────────────────────
      MerchantOrderItem(
        orderId: '#WRK-240515-0008',
        customerName: 'Reza Firmansyah',
        dateTime: '15 Mei 2024 • 08:45',
        itemCount: 2,
        total: 18000,
        status: MerchantOrderStatus.dibatalkan,
        pickupType: MerchantPickupType.diantar,
        storeName: 'Warunk Bu Siti',
      ),
    ],
  });

  List<MerchantOrderItem> get filteredOrders {
    final tabStatus = MerchantOrderStatus.values[selectedTab];
    return allOrders.where((o) => o.status == tabStatus).toList();
  }

  MerchantOrderState copyWith({int? selectedTab}) =>
      MerchantOrderState(
        selectedTab: selectedTab ?? this.selectedTab,
        allOrders: allOrders,
      );
}
