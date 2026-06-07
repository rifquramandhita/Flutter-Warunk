import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_location_placemark.freezed.dart';

@freezed
sealed class CustomerLocationPlacemark with _$CustomerLocationPlacemark {
  const factory CustomerLocationPlacemark.entity({
    required String province,
    required String city,
    required String district,
    required String postalCode,
    required String address,
  }) = CustomerLocationPlacemarkEntity;
}
