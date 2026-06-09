import 'package:equatable/equatable.dart';

class MerchantInputTopupState extends Equatable {
  final bool isLoading;
  final String? paymentUrl;
  final String? errorMessage;

  const MerchantInputTopupState({
    this.isLoading = false,
    this.paymentUrl,
    this.errorMessage,
  });

  MerchantInputTopupState copyWith({
    bool? isLoading,
    String? paymentUrl,
    String? errorMessage,
  }) {
    return MerchantInputTopupState(
      isLoading: isLoading ?? this.isLoading,
      paymentUrl: paymentUrl,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [isLoading, paymentUrl, errorMessage];
}
