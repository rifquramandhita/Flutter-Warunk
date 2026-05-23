part of 'merchant_input_account_bloc.dart';

sealed class MerchantInputAccountEvent extends Equatable {
  const MerchantInputAccountEvent();

  @override
  List<Object?> get props => [];
}

class MerchantInputAccountEventFetchStarted extends MerchantInputAccountEvent {}

class MerchantInputAccountEventAddAccount extends MerchantInputAccountEvent {}

class MerchantInputAccountEventRemoveAccount extends MerchantInputAccountEvent {
  final int index;
  const MerchantInputAccountEventRemoveAccount(this.index);

  @override
  List<Object?> get props => [index];
}

class MerchantInputAccountEventBankNameChanged extends MerchantInputAccountEvent {
  final int index;
  final String bankName;
  const MerchantInputAccountEventBankNameChanged(this.index, this.bankName);

  @override
  List<Object?> get props => [index, bankName];
}

class MerchantInputAccountEventAccountNameChanged extends MerchantInputAccountEvent {
  final int index;
  final String accountName;
  const MerchantInputAccountEventAccountNameChanged(this.index, this.accountName);

  @override
  List<Object?> get props => [index, accountName];
}

class MerchantInputAccountEventAccountNumberChanged extends MerchantInputAccountEvent {
  final int index;
  final String accountNumber;
  const MerchantInputAccountEventAccountNumberChanged(this.index, this.accountNumber);

  @override
  List<Object?> get props => [index, accountNumber];
}

class MerchantInputAccountEventSubmitted extends MerchantInputAccountEvent {}
