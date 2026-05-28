part of 'merchant_order_bloc.dart';

class MerchantOrderState extends Equatable {
  final String selectedTab;
  final List<String> availableTabs;
  final List<MerchantOrderEntity> allOrders;
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;

  const MerchantOrderState({
    this.selectedTab = '',
    this.availableTabs = const [],
    this.allOrders = const [],
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
  });

  List<MerchantOrderEntity> get filteredOrders {
    if (selectedTab.isEmpty) return allOrders;
    return allOrders.where((order) {
      return order.status == selectedTab;
    }).toList();
  }

  MerchantOrderState copyWith({
    String? selectedTab,
    List<String>? availableTabs,
    List<MerchantOrderEntity>? allOrders,
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
  }) {
    return MerchantOrderState(
      selectedTab: selectedTab ?? this.selectedTab,
      availableTabs: availableTabs ?? this.availableTabs,
      allOrders: allOrders ?? this.allOrders,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        selectedTab,
        availableTabs,
        allOrders,
        isLoading,
        isSuccess,
        errorMessage,
      ];
}
