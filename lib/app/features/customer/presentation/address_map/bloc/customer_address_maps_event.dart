part of 'customer_address_maps_bloc.dart';

sealed class CustomerAddressMapsEvent extends Equatable {
  const CustomerAddressMapsEvent();

  @override
  List<Object?> get props => [];
}

class CustomerAddressMapsEventInit extends CustomerAddressMapsEvent {
  final double? initialLatitude;
  final double? initialLongitude;

  const CustomerAddressMapsEventInit({
    this.initialLatitude,
    this.initialLongitude,
  });

  @override
  List<Object?> get props => [initialLatitude, initialLongitude];
}

class CustomerAddressMapsEventLocationChanged extends CustomerAddressMapsEvent {
  final double latitude;
  final double longitude;

  const CustomerAddressMapsEventLocationChanged(this.latitude, this.longitude);

  @override
  List<Object?> get props => [latitude, longitude];
}

class CustomerAddressMapsEventGetMyLocation extends CustomerAddressMapsEvent {}

class CustomerAddressMapsEventSearchLocation extends CustomerAddressMapsEvent {
  final String query;

  const CustomerAddressMapsEventSearchLocation(this.query);

  @override
  List<Object?> get props => [query];
}

class CustomerAddressMapsEventMoveCamera extends CustomerAddressMapsEvent {
  final double latitude;
  final double longitude;

  const CustomerAddressMapsEventMoveCamera(this.latitude, this.longitude);

  @override
  List<Object?> get props => [latitude, longitude];
}
