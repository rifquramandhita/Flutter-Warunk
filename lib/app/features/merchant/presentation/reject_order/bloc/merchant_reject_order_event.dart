part of 'merchant_reject_order_bloc.dart';

sealed class MerchantRejectOrderEvent extends Equatable {
  const MerchantRejectOrderEvent();

  @override
  List<Object?> get props => [];
}

class MerchantRejectOrderEventReasonChanged extends MerchantRejectOrderEvent {
  final String reason;
  const MerchantRejectOrderEventReasonChanged(this.reason);

  @override
  List<Object?> get props => [reason];
}

class MerchantRejectOrderEventBankChanged extends MerchantRejectOrderEvent {
  final String bank;
  const MerchantRejectOrderEventBankChanged(this.bank);

  @override
  List<Object?> get props => [bank];
}

class MerchantRejectOrderEventAccountNumberChanged extends MerchantRejectOrderEvent {
  final String accountNumber;
  const MerchantRejectOrderEventAccountNumberChanged(this.accountNumber);

  @override
  List<Object?> get props => [accountNumber];
}

class MerchantRejectOrderEventAccountNameChanged extends MerchantRejectOrderEvent {
  final String accountName;
  const MerchantRejectOrderEventAccountNameChanged(this.accountName);

  @override
  List<Object?> get props => [accountName];
}

class MerchantRejectOrderEventRefundProofPicked extends MerchantRejectOrderEvent {
  final File file;
  const MerchantRejectOrderEventRefundProofPicked(this.file);

  @override
  List<Object?> get props => [file];
}

class MerchantRejectOrderEventSubmit extends MerchantRejectOrderEvent {}
