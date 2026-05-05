part of 'customer_transaction_detail_bloc.dart';

abstract class CustomerTransactionDetailEvent {}

class CustomerTransactionDetailTrackOrder extends CustomerTransactionDetailEvent {}

class CustomerTransactionDetailContactMerchant extends CustomerTransactionDetailEvent {}
