import 'package:warunk/core/network/data_state.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_location_position.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_location_placemark.dart';

abstract class MerchantLocationRepository {
  Future<DataState<MerchantLocationPositionEntity>> getCurrentPosition();
  Future<DataState<MerchantLocationPlacemarkEntity>> getPlacemarkFromCoordinates(
    double latitude,
    double longitude,
  );
}
