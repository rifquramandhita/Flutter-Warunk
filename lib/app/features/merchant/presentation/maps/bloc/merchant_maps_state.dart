part of 'merchant_maps_bloc.dart';

class MerchantMapsState extends Equatable {
  final double? latitude;
  final double? longitude;
  final bool isLoadingLocation;
  final String? errorMessage;
  final bool moveCameraToCurrentLocation;

  const MerchantMapsState({
    this.latitude,
    this.longitude,
    this.isLoadingLocation = true,
    this.errorMessage,
    this.moveCameraToCurrentLocation = false,
  });

  MerchantMapsState copyWith({
    double? latitude,
    double? longitude,
    bool? isLoadingLocation,
    String? errorMessage,
    bool? moveCameraToCurrentLocation,
  }) {
    return MerchantMapsState(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      isLoadingLocation: isLoadingLocation ?? this.isLoadingLocation,
      errorMessage: errorMessage, // Do not fallback to this.errorMessage
      moveCameraToCurrentLocation: moveCameraToCurrentLocation ?? false, // Default to false so it only triggers once when true
    );
  }

  @override
  List<Object?> get props => [
        latitude,
        longitude,
        isLoadingLocation,
        errorMessage,
        moveCameraToCurrentLocation,
      ];
}
