part of 'customer_checkout_bloc.dart';

abstract class CustomerCheckoutEvent {}

class CustomerCheckoutDeliveryChanged extends CustomerCheckoutEvent {
  final int index;
  CustomerCheckoutDeliveryChanged(this.index);
}

class CustomerCheckoutVoucherRemoved extends CustomerCheckoutEvent {}
