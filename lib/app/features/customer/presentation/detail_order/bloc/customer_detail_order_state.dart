part of 'customer_detail_order_bloc.dart';

class CustomerDetailOrderState extends Equatable {
  final CustomerOrderEntity? transaction;
  final bool isLoading;
  final String? errorMessage;

  final bool isReorderSuccess;

  const CustomerDetailOrderState({
    this.transaction,
    this.isLoading = false,
    this.errorMessage,
    this.isReorderSuccess = false,
  });

  CustomerDetailOrderState copyWith({
    CustomerOrderEntity? transaction,
    bool? isLoading,
    String? errorMessage,
    bool? isReorderSuccess,
  }) {
    return CustomerDetailOrderState(
      transaction: transaction ?? this.transaction,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      isReorderSuccess: isReorderSuccess ?? false,
    );
  }

  @override
  List<Object?> get props => [transaction, isLoading, errorMessage, isReorderSuccess];
}
