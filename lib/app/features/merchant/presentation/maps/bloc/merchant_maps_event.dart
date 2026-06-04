part of 'merchant_maps_bloc.dart';

sealed class MerchantMapsEvent extends Equatable {
  const MerchantMapsEvent();

  @override
  List<Object?> get props => [];
}

class MerchantMapsEventInit extends MerchantMapsEvent {
  final double? initialLatitude;
  final double? initialLongitude;

  const MerchantMapsEventInit({
    this.initialLatitude,
    this.initialLongitude,
  });

  @override
  List<Object?> get props => [initialLatitude, initialLongitude];
}

class MerchantMapsEventLocationChanged extends MerchantMapsEvent {
  final double latitude;
  final double longitude;

  const MerchantMapsEventLocationChanged(this.latitude, this.longitude);

  @override
  List<Object?> get props => [latitude, longitude];
}

class MerchantMapsEventGetMyLocation extends MerchantMapsEvent {}
