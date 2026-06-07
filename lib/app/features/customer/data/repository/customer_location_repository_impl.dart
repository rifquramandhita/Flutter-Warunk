import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:warunk/core/network/data_state.dart';
import 'package:warunk/app/features/customer/domain/repository/customer_location_repository.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_location_position.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_location_placemark.dart';

class CustomerLocationRepositoryImpl implements CustomerLocationRepository {
  @override
  Future<DataState<CustomerLocationPositionEntity>> getCurrentPosition() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return ErrorState(message: 'Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return ErrorState(message: 'Location permissions are permanently denied');
      }

      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        await Geolocator.openLocationSettings();
        return ErrorState(message: 'Mohon nyalakan GPS Anda.');
      }

      Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
      );

      return SuccessState(
        data: CustomerLocationPositionEntity(
          latitude: position.latitude,
          longitude: position.longitude,
        ),
      );
    } catch (e) {
      return ErrorState(message: e.toString().replaceAll('Exception: ', ''));
    }
  }

  @override
  Future<DataState<CustomerLocationPlacemarkEntity>> getPlacemarkFromCoordinates(
    double latitude,
    double longitude,
  ) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        
        String newAddress = '${place.street ?? ''}, ${place.subLocality ?? ''}'.trim();
        if (newAddress.startsWith(',')) newAddress = newAddress.substring(1).trim();
        if (newAddress.endsWith(',')) newAddress = newAddress.substring(0, newAddress.length - 1).trim();

        return SuccessState(
          data: CustomerLocationPlacemarkEntity(
            province: place.administrativeArea ?? '',
            city: place.subAdministrativeArea ?? '',
            district: place.locality ?? '',
            postalCode: place.postalCode ?? '',
            address: newAddress,
          ),
        );
      }
      return ErrorState(message: 'No placemarks found');
    } catch (e) {
      return ErrorState(message: e.toString().replaceAll('Exception: ', ''));
    }
  }
}
