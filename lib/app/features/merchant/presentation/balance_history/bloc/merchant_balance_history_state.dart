part of 'merchant_balance_history_bloc.dart';

class MerchantBalanceHistoryState extends Equatable {
  final List<MerchantBalanceHistoryItemEntity> histories;
  final MerchantBalanceHistorySummaryEntity? summary;
  final bool isLoading;
  final String? errorMessage;

  const MerchantBalanceHistoryState({
    this.histories = const [],
    this.summary,
    this.isLoading = false,
    this.errorMessage,
  });

  MerchantBalanceHistoryState copyWith({
    List<MerchantBalanceHistoryItemEntity>? histories,
    MerchantBalanceHistorySummaryEntity? summary,
    bool? isLoading,
    String? errorMessage,
  }) {
    return MerchantBalanceHistoryState(
      histories: histories ?? this.histories,
      summary: summary ?? this.summary,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        histories,
        summary,
        isLoading,
        errorMessage,
      ];
}
