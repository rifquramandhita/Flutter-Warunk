import 'package:equatable/equatable.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_address.dart';

class CustomerAddressState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final List<CustomerAddressEntity> addresses;
  final String? selectedAddressId;

  const CustomerAddressState({
    this.isLoading = false,
    this.errorMessage,
    this.addresses = const [],
    this.selectedAddressId,
  });

  CustomerAddressState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<CustomerAddressEntity>? addresses,
    String? selectedAddressId,
  }) {
    return CustomerAddressState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      addresses: addresses ?? this.addresses,
      selectedAddressId: selectedAddressId ?? this.selectedAddressId,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    errorMessage,
    addresses,
    selectedAddressId,
  ];
}
