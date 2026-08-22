part of 'sales_merchant_bloc.dart';

class SalesMerchantState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final List<SalesMerchantEntity>? merchants;
  final bool hasReachedMax;
  
  final bool isClaimLoading;
  final String? claimSuccessMessage;
  final String? claimErrorMessage;
  
  final bool isWebviewLoading;
  final String? webviewUrl;
  final String? webviewErrorMessage;

  const SalesMerchantState({
    this.isLoading = false,
    this.errorMessage,
    this.merchants,
    this.hasReachedMax = false,
    this.isClaimLoading = false,
    this.claimSuccessMessage,
    this.claimErrorMessage,
    this.isWebviewLoading = false,
    this.webviewUrl,
    this.webviewErrorMessage,
  });

  SalesMerchantState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<SalesMerchantEntity>? merchants,
    bool? hasReachedMax,
    bool? isClaimLoading,
    String? claimSuccessMessage,
    String? claimErrorMessage,
    bool? isWebviewLoading,
    String? webviewUrl,
    String? webviewErrorMessage,
  }) {
    return SalesMerchantState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      merchants: merchants ?? this.merchants,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      isClaimLoading: isClaimLoading ?? this.isClaimLoading,
      claimSuccessMessage: claimSuccessMessage,
      claimErrorMessage: claimErrorMessage,
      isWebviewLoading: isWebviewLoading ?? this.isWebviewLoading,
      webviewUrl: webviewUrl, // intentional: allow null reset
      webviewErrorMessage: webviewErrorMessage,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        errorMessage,
        merchants,
        hasReachedMax,
        isClaimLoading,
        claimSuccessMessage,
        claimErrorMessage,
        isWebviewLoading,
        webviewUrl,
        webviewErrorMessage,
      ];
}
