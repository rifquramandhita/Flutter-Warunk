import 'package:equatable/equatable.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_merchant.dart';

class CustomerMerchantState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final List<CustomerMerchantEntity> merchants;

  const CustomerMerchantState({
    this.isLoading = false,
    this.errorMessage,
    this.merchants = const [],
  });

  CustomerMerchantState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<CustomerMerchantEntity>? merchants,
  }) {
    return CustomerMerchantState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      merchants: merchants ?? this.merchants,
    );
  }

  @override
  List<Object?> get props => [isLoading, errorMessage, merchants];
}
