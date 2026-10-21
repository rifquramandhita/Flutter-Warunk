import 'package:equatable/equatable.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_balance_history.dart';

class MerchantInputTopupState extends Equatable {
  final bool isLoading;
  final String? paymentUrl;
  final String? errorMessage;
  final MerchantBalanceTopUpResponseEntity? topUpResponse;

  const MerchantInputTopupState({
    this.isLoading = false,
    this.paymentUrl,
    this.errorMessage,
    this.topUpResponse,
  });

  MerchantInputTopupState copyWith({
    bool? isLoading,
    String? paymentUrl,
    String? errorMessage,
    MerchantBalanceTopUpResponseEntity? topUpResponse,
  }) {
    return MerchantInputTopupState(
      isLoading: isLoading ?? this.isLoading,
      paymentUrl: paymentUrl,
      errorMessage: errorMessage,
      topUpResponse: topUpResponse,
    );
  }

  @override
  List<Object?> get props => [isLoading, paymentUrl, errorMessage, topUpResponse];
}
