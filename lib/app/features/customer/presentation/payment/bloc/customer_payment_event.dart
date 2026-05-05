part of 'customer_payment_bloc.dart';

abstract class CustomerPaymentEvent {}

class CustomerPaymentMethodSelected extends CustomerPaymentEvent {
  final int index;
  CustomerPaymentMethodSelected(this.index);
}
