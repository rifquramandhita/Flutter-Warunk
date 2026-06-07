import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_location_position.freezed.dart';

@freezed
sealed class CustomerLocationPosition with _$CustomerLocationPosition {
  const factory CustomerLocationPosition.entity({
    required double latitude,
    required double longitude,
  }) = CustomerLocationPositionEntity;
}
