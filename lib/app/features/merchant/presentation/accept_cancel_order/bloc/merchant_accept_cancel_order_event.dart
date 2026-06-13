part of 'merchant_accept_cancel_order_bloc.dart';

sealed class MerchantAcceptCancelOrderEvent extends Equatable {
  const MerchantAcceptCancelOrderEvent();

  @override
  List<Object> get props => [];
}

class MerchantAcceptCancelOrderEventRefundProofPicked extends MerchantAcceptCancelOrderEvent {
  final File file;
  const MerchantAcceptCancelOrderEventRefundProofPicked(this.file);

  @override
  List<Object> get props => [file];
}

class MerchantAcceptCancelOrderEventSubmit extends MerchantAcceptCancelOrderEvent {}
