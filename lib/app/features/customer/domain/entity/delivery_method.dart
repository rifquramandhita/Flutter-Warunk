enum DeliveryMethod {
  internal,
  internalCourier,
  pickup,
  biteship;

  String get value {
    switch (this) {
      case DeliveryMethod.internal:
        return 'internal';
      case DeliveryMethod.internalCourier:
        return 'internal_courier';
      case DeliveryMethod.pickup:
        return 'pickup';
      case DeliveryMethod.biteship:
        return 'biteship';
    }
  }

  String get label {
    switch (this) {
      case DeliveryMethod.internal:
        return 'Kurir Internal';
      case DeliveryMethod.internalCourier:
        return 'Kurir Internal';
      case DeliveryMethod.pickup:
        return 'Ambil Sendiri';
      case DeliveryMethod.biteship:
        return 'Biteship';
    }
  }

  static DeliveryMethod? fromString(String? value) {
    switch (value) {
      case 'internal':
        return DeliveryMethod.internal;
      case 'internal_courier':
        return DeliveryMethod.internalCourier;
      case 'pickup':
        return DeliveryMethod.pickup;
      case 'biteship':
        return DeliveryMethod.biteship;
      default:
        return null;
    }
  }
}
