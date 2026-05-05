import 'package:equatable/equatable.dart';

class CustomerOrderSuccessState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final String orderId;

  const CustomerOrderSuccessState({
    this.isLoading = false,
    this.errorMessage,
    this.orderId = '#WRK-240128-018',
  });

  CustomerOrderSuccessState copyWith({
    bool? isLoading,
    String? errorMessage,
    String? orderId,
  }) {
    return CustomerOrderSuccessState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      orderId: orderId ?? this.orderId,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    errorMessage,
    orderId,
  ];
}
