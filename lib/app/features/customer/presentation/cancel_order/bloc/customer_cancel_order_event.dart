import 'package:equatable/equatable.dart';

sealed class CustomerCancelOrderEvent extends Equatable {
  const CustomerCancelOrderEvent();

  @override
  List<Object?> get props => [];
}

class CustomerCancelOrderSubmitted extends CustomerCancelOrderEvent {
  final String orderId;
  final String reason;
  final String? customerBank;
  final String? customerAccountNumber;
  final String? customerAccountName;

  const CustomerCancelOrderSubmitted({
    required this.orderId,
    required this.reason,
    this.customerBank,
    this.customerAccountNumber,
    this.customerAccountName,
  });

  @override
  List<Object?> get props => [
        orderId,
        reason,
        customerBank,
        customerAccountNumber,
        customerAccountName,
      ];
}
