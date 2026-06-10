part of 'customer_detail_order_bloc.dart';

abstract class CustomerDetailOrderEvent extends Equatable {
  const CustomerDetailOrderEvent();

  @override
  List<Object?> get props => [];
}

class CustomerDetailOrderFetchStarted extends CustomerDetailOrderEvent {
  final CustomerOrderEntity transaction;

  const CustomerDetailOrderFetchStarted(this.transaction);

  @override
  List<Object?> get props => [transaction];
}

class CustomerDetailOrderTrackOrder extends CustomerDetailOrderEvent {}

class CustomerDetailOrderContactMerchant extends CustomerDetailOrderEvent {}
