part of 'merchant_accept_cancel_order_bloc.dart';

class MerchantAcceptCancelOrderState extends Equatable {
  final File? refundProof;
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;

  const MerchantAcceptCancelOrderState({
    this.refundProof,
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
  });

  MerchantAcceptCancelOrderState copyWith({
    File? refundProof,
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
  }) {
    return MerchantAcceptCancelOrderState(
      refundProof: refundProof ?? this.refundProof,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        refundProof,
        isLoading,
        isSuccess,
        errorMessage,
      ];
}
