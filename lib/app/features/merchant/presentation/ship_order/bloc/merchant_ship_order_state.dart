part of 'merchant_ship_order_bloc.dart';

class MerchantShipOrderState extends Equatable {
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;

  const MerchantShipOrderState({
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
  });

  MerchantShipOrderState copyWith({
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
  }) {
    return MerchantShipOrderState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [isLoading, isSuccess, errorMessage];
}
