part of 'merchant_reject_cancel_order_bloc.dart';

class MerchantRejectCancelOrderState extends Equatable {
  final String reason;
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;

  const MerchantRejectCancelOrderState({
    this.reason = '',
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
  });

  MerchantRejectCancelOrderState copyWith({
    String? reason,
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
  }) {
    return MerchantRejectCancelOrderState(
      reason: reason ?? this.reason,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        reason,
        isLoading,
        isSuccess,
        errorMessage,
      ];
}
