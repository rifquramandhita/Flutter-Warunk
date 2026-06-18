part of 'merchant_dashboard_bloc.dart';

class MerchantDashboardState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final String selectedPeriod;
  final List<double> salesData;
  final List<String> salesLabels;
  final int newOrders;
  final int activeProducts;
  final int totalProducts;
  final double todaySales;
  final double salesGrowth;
  final double balance;
  final List<MerchantDashboardRecentOrderEntity> recentOrders;
  final String merchantName;
  final String merchantPhoto;
  final String merchantCategory;
  final String merchantTime;

  const MerchantDashboardState({
    this.isLoading = false,
    this.errorMessage,
    this.selectedPeriod = '7 Hari',
    this.salesData = const [0, 0, 0, 0, 0, 0, 0],
    this.salesLabels = const [
      'Kam',
      'Jum',
      'Sab',
      'Min',
      'Sen',
      'Sel',
      'Hari Ini',
    ],
    this.newOrders = 0,
    this.activeProducts = 0,
    this.totalProducts = 0,
    this.todaySales = 0,
    this.salesGrowth = 0.0,
    this.balance = 0,
    this.recentOrders = const [],
    this.merchantName = '',
    this.merchantPhoto = '',
    this.merchantCategory = '',
    this.merchantTime = '',
  });

  MerchantDashboardState copyWith({
    bool? isLoading,
    String? errorMessage,
    String? selectedPeriod,
    List<double>? salesData,
    List<String>? salesLabels,
    int? newOrders,
    int? activeProducts,
    int? totalProducts,
    double? todaySales,
    double? salesGrowth,
    double? balance,
    List<MerchantDashboardRecentOrderEntity>? recentOrders,
    String? merchantName,
    String? merchantPhoto,
    String? merchantCategory,
    String? merchantTime,
  }) => MerchantDashboardState(
    isLoading: isLoading ?? this.isLoading,
    errorMessage: errorMessage, // DO NOT use fallback so it can be reset
    selectedPeriod: selectedPeriod ?? this.selectedPeriod,
    salesData: salesData ?? this.salesData,
    salesLabels: salesLabels ?? this.salesLabels,
    newOrders: newOrders ?? this.newOrders,
    activeProducts: activeProducts ?? this.activeProducts,
    totalProducts: totalProducts ?? this.totalProducts,
    todaySales: todaySales ?? this.todaySales,
    salesGrowth: salesGrowth ?? this.salesGrowth,
    balance: balance ?? this.balance,
    recentOrders: recentOrders ?? this.recentOrders,
    merchantName: merchantName ?? this.merchantName,
    merchantPhoto: merchantPhoto ?? this.merchantPhoto,
    merchantCategory: merchantCategory ?? this.merchantCategory,
    merchantTime: merchantTime ?? this.merchantTime,
  );

  @override
  List<Object?> get props => [
    isLoading,
    errorMessage,
    selectedPeriod,
    salesData,
    salesLabels,
    newOrders,
    activeProducts,
    totalProducts,
    todaySales,
    salesGrowth,
    balance,
    recentOrders,
    merchantName,
    merchantPhoto,
    merchantCategory,
    merchantTime,
  ];
}
