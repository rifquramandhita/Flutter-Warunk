import 'package:warunk/core/network/data_state.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_location_position.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_location_placemark.dart';

abstract class CustomerLocationRepository {
  Future<DataState<CustomerLocationPositionEntity>> getCurrentPosition();
  Future<DataState<CustomerLocationPlacemarkEntity>> getPlacemarkFromCoordinates(
    double latitude,
    double longitude,
  );
}
