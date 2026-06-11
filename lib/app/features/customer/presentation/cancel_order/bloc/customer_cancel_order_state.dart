import 'package:equatable/equatable.dart';

enum CustomerCancelOrderStatus { initial, loading, success, failure }

class CustomerCancelOrderState extends Equatable {
  final CustomerCancelOrderStatus status;
  final String? errorMessage;
  final String? successMessage;

  const CustomerCancelOrderState({
    this.status = CustomerCancelOrderStatus.initial,
    this.errorMessage,
    this.successMessage,
  });

  CustomerCancelOrderState copyWith({
    CustomerCancelOrderStatus? status,
    String? errorMessage,
    String? successMessage,
  }) {
    return CustomerCancelOrderState(
      status: status ?? this.status,
      errorMessage: errorMessage,
      successMessage: successMessage,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage, successMessage];
}
