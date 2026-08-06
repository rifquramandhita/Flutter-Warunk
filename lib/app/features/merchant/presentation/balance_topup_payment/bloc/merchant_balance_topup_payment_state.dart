import 'package:equatable/equatable.dart';

class MerchantBalanceTopupPaymentState extends Equatable {
  final bool isLoading;
  final bool isPaymentFinished;
  final String? errorMessage;

  const MerchantBalanceTopupPaymentState({
    this.isLoading = true,
    this.isPaymentFinished = false,
    this.errorMessage,
  });

  MerchantBalanceTopupPaymentState copyWith({
    bool? isLoading,
    bool? isPaymentFinished,
    String? errorMessage,
  }) {
    return MerchantBalanceTopupPaymentState(
      isLoading: isLoading ?? this.isLoading,
      isPaymentFinished: isPaymentFinished ?? this.isPaymentFinished,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [isLoading, isPaymentFinished, errorMessage];
}
