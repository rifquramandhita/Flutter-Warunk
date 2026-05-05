part of 'customer_transaction_bloc.dart';

abstract class CustomerTransactionEvent {}

class CustomerTransactionTabChanged extends CustomerTransactionEvent {
  final int tab;
  CustomerTransactionTabChanged(this.tab);
}

class CustomerTransactionDateFilterChanged extends CustomerTransactionEvent {
  final String filter;
  CustomerTransactionDateFilterChanged(this.filter);
}

class CustomerTransactionStatusFilterChanged extends CustomerTransactionEvent {
  final String filter;
  CustomerTransactionStatusFilterChanged(this.filter);
}
