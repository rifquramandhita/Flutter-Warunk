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
  final bool hasWelcomePopup;
  final String? merchantStatus;
  final String? merchantReportReason;
  final String? whatsAppNumber;
  final bool shouldLaunchWhatsApp;
  final String? chatUrl;
  final bool shouldLaunchChatUrl;

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
    this.hasWelcomePopup = false,
    this.merchantStatus,
    this.merchantReportReason,
    this.whatsAppNumber,
    this.shouldLaunchWhatsApp = false,
    this.chatUrl,
    this.shouldLaunchChatUrl = false,
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
    bool? hasWelcomePopup,
    String? merchantStatus,
    String? merchantReportReason,
    String? whatsAppNumber,
    bool? shouldLaunchWhatsApp,
    String? chatUrl,
    bool? shouldLaunchChatUrl,
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
    hasWelcomePopup: hasWelcomePopup ?? this.hasWelcomePopup,
    merchantStatus: merchantStatus ?? this.merchantStatus,
    merchantReportReason: merchantReportReason ?? this.merchantReportReason,
    whatsAppNumber: whatsAppNumber ?? this.whatsAppNumber,
    shouldLaunchWhatsApp: shouldLaunchWhatsApp ?? this.shouldLaunchWhatsApp,
    chatUrl: chatUrl ?? this.chatUrl,
    shouldLaunchChatUrl: shouldLaunchChatUrl ?? this.shouldLaunchChatUrl,
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
    hasWelcomePopup,
    merchantStatus,
    merchantReportReason,
    whatsAppNumber,
    shouldLaunchWhatsApp,
    chatUrl,
    shouldLaunchChatUrl,
  ];
}
