part of 'merchant_input_address_bloc.dart';

abstract class MerchantInputAddressEvent {}

class MerchantInputAddressEventGet extends MerchantInputAddressEvent {}

class MerchantInputAddressEventAddressChanged extends MerchantInputAddressEvent {
  final String address;
  MerchantInputAddressEventAddressChanged(this.address);
}

class MerchantInputAddressEventProvinceChanged extends MerchantInputAddressEvent {
  final String province;
  MerchantInputAddressEventProvinceChanged(this.province);
}

class MerchantInputAddressEventCityChanged extends MerchantInputAddressEvent {
  final String city;
  MerchantInputAddressEventCityChanged(this.city);
}

class MerchantInputAddressEventDistrictChanged extends MerchantInputAddressEvent {
  final String district;
  MerchantInputAddressEventDistrictChanged(this.district);
}

class MerchantInputAddressEventPostalCodeChanged extends MerchantInputAddressEvent {
  final String postalCode;
  MerchantInputAddressEventPostalCodeChanged(this.postalCode);
}

class MerchantInputAddressEventLocationChanged extends MerchantInputAddressEvent {
  final double longitude;
  final double latitude;
  MerchantInputAddressEventLocationChanged(this.longitude, this.latitude);
}

class MerchantInputAddressEventSaved extends MerchantInputAddressEvent {}
