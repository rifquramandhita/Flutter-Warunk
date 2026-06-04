import 'package:freezed_annotation/freezed_annotation.dart';

part 'merchant_location_placemark.freezed.dart';

@freezed
sealed class MerchantLocationPlacemark with _$MerchantLocationPlacemark {
  const factory MerchantLocationPlacemark.entity({
    required String province,
    required String city,
    required String district,
    required String postalCode,
    required String address,
  }) = MerchantLocationPlacemarkEntity;
}
