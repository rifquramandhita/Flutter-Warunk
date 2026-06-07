import 'package:equatable/equatable.dart';
import 'package:warunk/core/network/data_state.dart';
import 'package:warunk/app/features/customer/domain/repository/customer_location_repository.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_location_placemark.dart';

class CustomerLocationGetPlacemarkParams extends Equatable {
  final double latitude;
  final double longitude;

  const CustomerLocationGetPlacemarkParams({
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object?> get props => [latitude, longitude];
}

class CustomerLocationGetPlacemarkUseCase {
  final CustomerLocationRepository _repository;

  CustomerLocationGetPlacemarkUseCase(this._repository);

  Future<DataState<CustomerLocationPlacemarkEntity>> call({
    required CustomerLocationGetPlacemarkParams params,
  }) {
    return _repository.getPlacemarkFromCoordinates(
      params.latitude,
      params.longitude,
    );
  }
}
