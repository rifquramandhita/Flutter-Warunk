part of 'merchant_detail_order_bloc.dart';

class MerchantDetailOrderState extends Equatable {
  final MerchantOrderEntity? order;
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;

  const MerchantDetailOrderState({
    this.order,
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
  });

  MerchantDetailOrderState copyWith({
    MerchantOrderEntity? order,
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
  }) {
    return MerchantDetailOrderState(
      order: order ?? this.order,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        order,
        isLoading,
        isSuccess,
        errorMessage,
      ];
}
