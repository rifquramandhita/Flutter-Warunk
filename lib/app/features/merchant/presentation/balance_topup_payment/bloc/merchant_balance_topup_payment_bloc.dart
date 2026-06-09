import 'package:flutter_bloc/flutter_bloc.dart';
import 'merchant_balance_topup_payment_event.dart';
import 'merchant_balance_topup_payment_state.dart';

class MerchantBalanceTopupPaymentBloc extends Bloc<
    MerchantBalanceTopupPaymentEvent, MerchantBalanceTopupPaymentState> {
  MerchantBalanceTopupPaymentBloc()
      : super(const MerchantBalanceTopupPaymentState()) {
    on<MerchantBalanceTopupPaymentEventPageFinished>(_onPageFinished);
  }

  void _onPageFinished(
    MerchantBalanceTopupPaymentEventPageFinished event,
    Emitter<MerchantBalanceTopupPaymentState> emit,
  ) {
    emit(state.copyWith(isLoading: false));
  }
}
