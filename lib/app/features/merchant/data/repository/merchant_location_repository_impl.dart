import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:warunk/core/network/data_state.dart';
import 'package:warunk/app/features/merchant/domain/repository/merchant_location_repository.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_location_position.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_location_placemark.dart';

class MerchantLocationRepositoryImpl implements MerchantLocationRepository {
  @override
  Future<DataState<MerchantLocationPositionEntity>> getCurrentPosition() async {
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

      Position? position;
      try {
        position = await Geolocator.getCurrentPosition(
          locationSettings: const LocationSettings(
            accuracy: LocationAccuracy.high,
            timeLimit: Duration(seconds: 5),
          ),
        );
      } catch (_) {
        position = await Geolocator.getLastKnownPosition();
      }

      position ??= await Geolocator.getLastKnownPosition();

      if (position != null) {
        return SuccessState(
          data: MerchantLocationPositionEntity(
            latitude: position.latitude,
            longitude: position.longitude,
          ),
        );
      }

      return ErrorState(
        message: 'Tidak dapat mendapatkan lokasi saat ini. Silakan tentukan lokasi di peta.',
      );
    } catch (e) {
      return ErrorState(message: e.toString().replaceAll('Exception: ', ''));
    }
  }

  @override
  Future<DataState<MerchantLocationPlacemarkEntity>> getPlacemarkFromCoordinates(
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
          data: MerchantLocationPlacemarkEntity(
            province: place.administrativeArea ?? '',
            city: place.subAdministrativeArea ?? '',
            district: (place.locality?.isNotEmpty ?? false)
                ? '${place.locality} ${place.subLocality ?? ''}'.trim()
                : (place.subLocality ?? ''),
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
