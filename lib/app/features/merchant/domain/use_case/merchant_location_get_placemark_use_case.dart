import 'package:equatable/equatable.dart';
import 'package:warunk/core/network/data_state.dart';
import 'package:warunk/app/features/merchant/domain/repository/merchant_location_repository.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_location_placemark.dart';

class MerchantLocationGetPlacemarkParams extends Equatable {
  final double latitude;
  final double longitude;

  const MerchantLocationGetPlacemarkParams({
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object?> get props => [latitude, longitude];
}

class MerchantLocationGetPlacemarkUseCase {
  final MerchantLocationRepository _repository;

  MerchantLocationGetPlacemarkUseCase(this._repository);

  Future<DataState<MerchantLocationPlacemarkEntity>> call({
    required MerchantLocationGetPlacemarkParams params,
  }) {
    return _repository.getPlacemarkFromCoordinates(
      params.latitude,
      params.longitude,
    );
  }
}
