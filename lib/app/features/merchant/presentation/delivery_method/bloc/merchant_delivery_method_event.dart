part of 'merchant_delivery_method_bloc.dart';

sealed class MerchantDeliveryMethodEvent {}

class MerchantDeliveryMethodToggled extends MerchantDeliveryMethodEvent {
  final String id;
  MerchantDeliveryMethodToggled(this.id);
}

class MerchantDeliveryMethodSaved extends MerchantDeliveryMethodEvent {}
