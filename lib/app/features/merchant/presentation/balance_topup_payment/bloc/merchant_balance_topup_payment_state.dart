import 'package:equatable/equatable.dart';

class MerchantBalanceTopupPaymentState extends Equatable {
  final bool isLoading;
  final String? errorMessage;

  const MerchantBalanceTopupPaymentState({
    this.isLoading = true,
    this.errorMessage,
  });

  MerchantBalanceTopupPaymentState copyWith({
    bool? isLoading,
    String? errorMessage,
  }) {
    return MerchantBalanceTopupPaymentState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [isLoading, errorMessage];
}
