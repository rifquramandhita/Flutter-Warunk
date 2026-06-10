part of 'customer_detail_order_bloc.dart';

class CustomerDetailOrderState extends Equatable {
  final CustomerOrderEntity? transaction;
  final bool isLoading;
  final String? errorMessage;

  const CustomerDetailOrderState({
    this.transaction,
    this.isLoading = false,
    this.errorMessage,
  });

  CustomerDetailOrderState copyWith({
    CustomerOrderEntity? transaction,
    bool? isLoading,
    String? errorMessage,
  }) {
    return CustomerDetailOrderState(
      transaction: transaction ?? this.transaction,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [transaction, isLoading, errorMessage];
}
