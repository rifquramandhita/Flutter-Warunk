import 'package:freezed_annotation/freezed_annotation.dart';

part 'merchant_location_position.freezed.dart';

@freezed
sealed class MerchantLocationPosition with _$MerchantLocationPosition {
  const factory MerchantLocationPosition.entity({
    required double latitude,
    required double longitude,
  }) = MerchantLocationPositionEntity;
}
