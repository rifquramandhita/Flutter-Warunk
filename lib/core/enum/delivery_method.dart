enum DeliveryMethodEnum {
  internal,
  internalCourier,
  pickup,
  biteship;

  String get value {
    switch (this) {
      case DeliveryMethodEnum.internal:
        return 'internal';
      case DeliveryMethodEnum.internalCourier:
        return 'internal_courier';
      case DeliveryMethodEnum.pickup:
        return 'pickup';
      case DeliveryMethodEnum.biteship:
        return 'biteship';
    }
  }

  String get label {
    switch (this) {
      case DeliveryMethodEnum.internal:
        return 'Kurir Internal';
      case DeliveryMethodEnum.internalCourier:
        return 'Kurir Internal';
      case DeliveryMethodEnum.pickup:
        return 'Ambil Sendiri';
      case DeliveryMethodEnum.biteship:
        return 'Biteship';
    }
  }

  static DeliveryMethodEnum? fromString(String? value) {
    switch (value) {
      case 'internal':
        return DeliveryMethodEnum.internal;
      case 'internal_courier':
        return DeliveryMethodEnum.internalCourier;
      case 'pickup':
        return DeliveryMethodEnum.pickup;
      case 'biteship':
        return DeliveryMethodEnum.biteship;
      default:
        return null;
    }
  }
}
