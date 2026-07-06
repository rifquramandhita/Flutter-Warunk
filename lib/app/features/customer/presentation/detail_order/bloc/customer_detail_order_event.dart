part of 'customer_detail_order_bloc.dart';

abstract class CustomerDetailOrderEvent extends Equatable {
  const CustomerDetailOrderEvent();

  @override
  List<Object?> get props => [];
}

class CustomerDetailOrderFetchStarted extends CustomerDetailOrderEvent {
  final String orderId;

  const CustomerDetailOrderFetchStarted(this.orderId);

  @override
  List<Object?> get props => [orderId];
}

class CustomerDetailOrderTrackOrder extends CustomerDetailOrderEvent {}

class CustomerDetailOrderContactMerchant extends CustomerDetailOrderEvent {}

class CustomerDetailOrderMarkReceived extends CustomerDetailOrderEvent {
  final String orderId;

  const CustomerDetailOrderMarkReceived(this.orderId);

  @override
  List<Object?> get props => [orderId];
}
