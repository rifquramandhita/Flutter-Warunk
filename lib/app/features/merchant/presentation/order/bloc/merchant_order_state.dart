part of 'merchant_order_bloc.dart';

enum MerchantOrderStatus { baru, diproses, selesai, dibatalkan }

enum MerchantPickupType { ambilDiTempat, diantar }

class MerchantOrderState extends Equatable {
  final int selectedTab;
  final List<MerchantOrderEntity> allOrders;
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;

  const MerchantOrderState({
    this.selectedTab = 0,
    this.allOrders = const [],
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
  });

  List<MerchantOrderEntity> get filteredOrders {
    final tabStatus = MerchantOrderStatus.values[selectedTab];
    return allOrders.where((order) {
      final String status = order.status ?? '';
      final MerchantOrderStatus mappedStatus;

      // Map API statuses to UI tabs
      if (status == 'completed' || status == 'delivered') {
        mappedStatus = MerchantOrderStatus.selesai;
      } else if (status == 'cancelled' || status == 'rejected') {
        mappedStatus = MerchantOrderStatus.dibatalkan;
      } else if (status == 'processing' || status == 'on_delivery') {
        mappedStatus = MerchantOrderStatus.diproses;
      } else {
        // Default to 'baru' for 'waiting_payment_confirmation', 'new', etc.
        mappedStatus = MerchantOrderStatus.baru;
      }

      return mappedStatus == tabStatus;
    }).toList();
  }

  MerchantOrderState copyWith({
    int? selectedTab,
    List<MerchantOrderEntity>? allOrders,
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
  }) {
    return MerchantOrderState(
      selectedTab: selectedTab ?? this.selectedTab,
      allOrders: allOrders ?? this.allOrders,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        selectedTab,
        allOrders,
        isLoading,
        isSuccess,
        errorMessage,
      ];
}
