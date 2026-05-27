part of 'merchant_ship_order_bloc.dart';

sealed class MerchantShipOrderEvent {}

class MerchantShipOrderEventShip extends MerchantShipOrderEvent {
  final MerchantOrderShipSendParam param;
  MerchantShipOrderEventShip(this.param);
}
