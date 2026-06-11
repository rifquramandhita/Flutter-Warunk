part of 'customer_order_bloc.dart';

class CustomerOrderState {
  final bool isLoading;
  final String? errorMessage;
  final List<CustomerOrderEntity> orders;
  final DateTimeRange? dateRangeFilter;
  final OrderStatus? statusFilter;

  const CustomerOrderState({
    this.isLoading = false,
    this.errorMessage,
    this.orders = const [],
    this.dateRangeFilter,
    this.statusFilter,
  });

  List<CustomerOrderEntity> get filteredTransactions {
    return orders.where((t) {
      final status = t.status;
      
      if (statusFilter != null && status != statusFilter) {
        return false;
      }

      if (dateRangeFilter != null && t.createdAt != null) {
        try {
          final txDate = DateTime.parse(t.createdAt!);
          // Set to local timezone if needed or just compare directly.
          // The range filter usually goes from 00:00:00 of start date to 23:59:59 of end date
          final start = dateRangeFilter!.start;
          final end = dateRangeFilter!.end.add(const Duration(days: 1)).subtract(const Duration(microseconds: 1));
          
          if (txDate.isBefore(start) || txDate.isAfter(end)) {
            return false;
          }
        } catch (_) {}
      }

      return true;
    }).toList();
  }

  CustomerOrderState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<CustomerOrderEntity>? orders,
    DateTimeRange? dateRangeFilter,
    bool clearDateRange = false,
    OrderStatus? statusFilter,
  }) =>
      CustomerOrderState(
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage,
        orders: orders ?? this.orders,
        dateRangeFilter: clearDateRange ? null : (dateRangeFilter ?? this.dateRangeFilter),
        statusFilter: statusFilter ?? this.statusFilter,
      );
}
