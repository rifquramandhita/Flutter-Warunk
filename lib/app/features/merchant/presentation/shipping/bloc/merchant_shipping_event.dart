part of 'merchant_shipping_bloc.dart';

sealed class MerchantShippingEvent {}

class MerchantShippingGet extends MerchantShippingEvent {}

class MerchantShippingToggleMethod extends MerchantShippingEvent {
  final String methodKey; // 'pickup_at_store', 'internal_courier', 'instant_courier'
  MerchantShippingToggleMethod(this.methodKey);
}

class MerchantShippingUpdateMaxDistance extends MerchantShippingEvent {
  final int maxDistance;
  MerchantShippingUpdateMaxDistance(this.maxDistance);
}

class MerchantShippingToggleCourier extends MerchantShippingEvent {
  final String courierCode;
  MerchantShippingToggleCourier(this.courierCode);
}

class MerchantShippingSaved extends MerchantShippingEvent {}
