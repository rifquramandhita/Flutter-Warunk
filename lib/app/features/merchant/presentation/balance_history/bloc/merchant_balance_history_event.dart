part of 'merchant_balance_history_bloc.dart';

abstract class MerchantBalanceHistoryEvent extends Equatable {
  const MerchantBalanceHistoryEvent();

  @override
  List<Object?> get props => [];
}

class MerchantBalanceHistoryEventFetch extends MerchantBalanceHistoryEvent {}

class MerchantBalanceHistoryEventChangeFilter
    extends MerchantBalanceHistoryEvent {
  final String status;

  const MerchantBalanceHistoryEventChangeFilter(this.status);

  @override
  List<Object?> get props => [status];
}
