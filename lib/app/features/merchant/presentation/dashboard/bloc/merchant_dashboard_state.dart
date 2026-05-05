part of 'merchant_dashboard_bloc.dart';

enum MerchantOrderStatus { diproses, siapDiantar, selesai, dibatalkan }

class MerchantOrderItem {
  final String orderId;
  final String customerName;
  final String dateTime;
  final int total;
  final MerchantOrderStatus status;

  const MerchantOrderItem({
    required this.orderId,
    required this.customerName,
    required this.dateTime,
    required this.total,
    required this.status,
  });
}

class MerchantDashboardState {
  final String selectedPeriod;
  final List<double> salesData;
  final List<String> salesLabels;
  final int newOrders;
  final int activeProducts;
  final int totalProducts;
  final double todaySales;
  final double salesGrowth;
  final double balance;
  final List<MerchantOrderItem> recentOrders;

  const MerchantDashboardState({
    this.selectedPeriod = '7 Hari',
    this.salesData = const [200000, 350000, 900000, 400000, 750000, 700000, 1400000],
    this.salesLabels = const ['Kam', 'Jum', 'Sab', 'Min', 'Sen', 'Sel', 'Hari Ini'],
    this.newOrders = 8,
    this.activeProducts = 42,
    this.totalProducts = 48,
    this.todaySales = 1250000,
    this.salesGrowth = 12.5,
    this.balance = 2345000,
    this.recentOrders = const [
      MerchantOrderItem(
        orderId: '#WRK-240515-0012',
        customerName: 'Andi Pratama',
        dateTime: '15 Mei 2024 · 10:32',
        total: 34000,
        status: MerchantOrderStatus.diproses,
      ),
      MerchantOrderItem(
        orderId: '#WRK-240515-0011',
        customerName: 'Siti Aminah',
        dateTime: '15 Mei 2024 · 09:58',
        total: 28000,
        status: MerchantOrderStatus.siapDiantar,
      ),
      MerchantOrderItem(
        orderId: '#WRK-240515-0010',
        customerName: 'Budi Santoso',
        dateTime: '15 Mei 2024 · 09:21',
        total: 45000,
        status: MerchantOrderStatus.selesai,
      ),
    ],
  });

  MerchantDashboardState copyWith({String? selectedPeriod}) =>
      MerchantDashboardState(
        selectedPeriod: selectedPeriod ?? this.selectedPeriod,
        salesData: salesData,
        salesLabels: salesLabels,
        newOrders: newOrders,
        activeProducts: activeProducts,
        totalProducts: totalProducts,
        todaySales: todaySales,
        salesGrowth: salesGrowth,
        balance: balance,
        recentOrders: recentOrders,
      );
}
