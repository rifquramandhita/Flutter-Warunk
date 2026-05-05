part of 'merchant_payment_method_bloc.dart';

sealed class MerchantPaymentMethodEvent {}

class MerchantPaymentMethodToggled extends MerchantPaymentMethodEvent {
  final String id;
  MerchantPaymentMethodToggled(this.id);
}
