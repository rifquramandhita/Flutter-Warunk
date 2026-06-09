part of 'merchant_balance_history_bloc.dart';

abstract class MerchantBalanceHistoryEvent extends Equatable {
  const MerchantBalanceHistoryEvent();

  @override
  List<Object> get props => [];
}

class MerchantBalanceHistoryEventFetch extends MerchantBalanceHistoryEvent {}
