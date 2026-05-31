part of 'customer_input_address_bloc.dart';

abstract class CustomerInputAddressEvent extends Equatable {
  const CustomerInputAddressEvent();

  @override
  List<Object?> get props => [];
}

class CustomerInputAddressEventInit extends CustomerInputAddressEvent {
  final String? id;

  const CustomerInputAddressEventInit({this.id});

  @override
  List<Object?> get props => [id];
}

class CustomerInputAddressEventRecipientNameChanged extends CustomerInputAddressEvent {
  final String recipientName;
  const CustomerInputAddressEventRecipientNameChanged(this.recipientName);
  @override
  List<Object?> get props => [recipientName];
}

class CustomerInputAddressEventPhoneChanged extends CustomerInputAddressEvent {
  final String phone;
  const CustomerInputAddressEventPhoneChanged(this.phone);
  @override
  List<Object?> get props => [phone];
}

class CustomerInputAddressEventLabelChanged extends CustomerInputAddressEvent {
  final String label;
  const CustomerInputAddressEventLabelChanged(this.label);
  @override
  List<Object?> get props => [label];
}

class CustomerInputAddressEventAddressChanged extends CustomerInputAddressEvent {
  final String address;
  const CustomerInputAddressEventAddressChanged(this.address);
  @override
  List<Object?> get props => [address];
}

class CustomerInputAddressEventProvinceChanged extends CustomerInputAddressEvent {
  final String province;
  const CustomerInputAddressEventProvinceChanged(this.province);
  @override
  List<Object?> get props => [province];
}

class CustomerInputAddressEventCityChanged extends CustomerInputAddressEvent {
  final String city;
  const CustomerInputAddressEventCityChanged(this.city);
  @override
  List<Object?> get props => [city];
}

class CustomerInputAddressEventDistrictChanged extends CustomerInputAddressEvent {
  final String district;
  const CustomerInputAddressEventDistrictChanged(this.district);
  @override
  List<Object?> get props => [district];
}

class CustomerInputAddressEventPostalCodeChanged extends CustomerInputAddressEvent {
  final String postalCode;
  const CustomerInputAddressEventPostalCodeChanged(this.postalCode);
  @override
  List<Object?> get props => [postalCode];
}

class CustomerInputAddressEventLocationChanged extends CustomerInputAddressEvent {
  final double longitude;
  final double latitude;
  const CustomerInputAddressEventLocationChanged(this.longitude, this.latitude);
  @override
  List<Object?> get props => [longitude, latitude];
}

class CustomerInputAddressEventNotesChanged extends CustomerInputAddressEvent {
  final String notes;
  const CustomerInputAddressEventNotesChanged(this.notes);
  @override
  List<Object?> get props => [notes];
}

class CustomerInputAddressEventIsDefaultChanged extends CustomerInputAddressEvent {
  final bool isDefault;
  const CustomerInputAddressEventIsDefaultChanged(this.isDefault);
  @override
  List<Object?> get props => [isDefault];
}

class CustomerInputAddressEventSaved extends CustomerInputAddressEvent {}
