part of 'merchant_balance_history_bloc.dart';

class MerchantBalanceHistoryState extends Equatable {
  final List<MerchantBalanceHistoryItemEntity> histories;
  final MerchantBalanceHistorySummaryEntity? summary;
  final bool isLoading;
  final String? errorMessage;
  final String selectedStatusFilter;

  const MerchantBalanceHistoryState({
    this.histories = const [],
    this.summary,
    this.isLoading = false,
    this.errorMessage,
    this.selectedStatusFilter = 'all',
  });

  List<MerchantBalanceHistoryItemEntity> get filteredHistories {
    if (selectedStatusFilter == 'all') {
      return histories;
    }
    return histories.where((item) {
      final status = (item.paymentStatus ?? '').toLowerCase();
      if (selectedStatusFilter == 'success') {
        return status == 'success' || status == 'paid' || status == 'settlement';
      } else if (selectedStatusFilter == 'pending') {
        return status == 'pending' || status == 'unpaid';
      } else if (selectedStatusFilter == 'waiting_proof') {
        return status == 'waiting_proof' || status == 'waiting';
      } else if (selectedStatusFilter == 'failed') {
        return status == 'failed' || status == 'cancel' || status == 'cancelled' || status == 'expire' || status == 'expired';
      }
      return status == selectedStatusFilter;
    }).toList();
  }

  MerchantBalanceHistoryState copyWith({
    List<MerchantBalanceHistoryItemEntity>? histories,
    MerchantBalanceHistorySummaryEntity? summary,
    bool? isLoading,
    String? errorMessage,
    String? selectedStatusFilter,
  }) {
    return MerchantBalanceHistoryState(
      histories: histories ?? this.histories,
      summary: summary ?? this.summary,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      selectedStatusFilter:
          selectedStatusFilter ?? this.selectedStatusFilter,
    );
  }

  @override
  List<Object?> get props => [
        histories,
        summary,
        isLoading,
        errorMessage,
        selectedStatusFilter,
      ];
}
