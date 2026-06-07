enum DeliveryMethod {
  internal,
  pickup,
  biteship;

  String get value {
    switch (this) {
      case DeliveryMethod.internal:
        return 'internal';
      case DeliveryMethod.pickup:
        return 'pickup';
      case DeliveryMethod.biteship:
        return 'biteship';
    }
  }

  static DeliveryMethod? fromString(String? value) {
    switch (value) {
      case 'internal':
        return DeliveryMethod.internal;
      case 'pickup':
        return DeliveryMethod.pickup;
      case 'biteship':
        return DeliveryMethod.biteship;
      default:
        return null;
    }
  }
}
