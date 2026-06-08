import 'package:equatable/equatable.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_order.dart';

class CustomerOrderSuccessState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final CustomerOrderEntity? order;

  const CustomerOrderSuccessState({
    this.isLoading = false,
    this.errorMessage,
    this.order,
  });

  CustomerOrderSuccessState copyWith({
    bool? isLoading,
    String? errorMessage,
    CustomerOrderEntity? order,
  }) {
    return CustomerOrderSuccessState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      order: order ?? this.order,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    errorMessage,
    order,
  ];
}
