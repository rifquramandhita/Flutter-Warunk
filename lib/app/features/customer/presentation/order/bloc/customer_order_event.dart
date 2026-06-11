part of 'customer_order_bloc.dart';

abstract class CustomerOrderEvent {}

class CustomerOrderFetchStarted extends CustomerOrderEvent {}

class CustomerOrderDateRangeFilterChanged extends CustomerOrderEvent {
  final DateTimeRange? range;
  CustomerOrderDateRangeFilterChanged(this.range);
}

class CustomerOrderStatusFilterChanged extends CustomerOrderEvent {
  final OrderStatus? filter;
  CustomerOrderStatusFilterChanged(this.filter);
}
