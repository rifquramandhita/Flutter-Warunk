import 'package:freezed_annotation/freezed_annotation.dart';

part 'merchant_operational_hour_item.freezed.dart';
part 'merchant_operational_hour_item.g.dart';

@freezed
sealed class MerchantOperationalHourItem with _$MerchantOperationalHourItem {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory MerchantOperationalHourItem.entity({
    required String id,
    required String day,
    required bool isClosed,
    @JsonKey(name: 'is_open_24_hours') required bool isOpen24Hours,
    String? timeOpen,
    String? timeClose,
  }) = MerchantOperationalHourItemEntity;

  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory MerchantOperationalHourItem.updateParam({
    required String day,
    required bool isClosed,
    @JsonKey(name: 'is_open_24_hours') required bool isOpen24Hours,
    String? timeOpen,
    String? timeClose,
  }) = MerchantOperationalHourItemUpdateParam;

  factory MerchantOperationalHourItem.fromJson(Map<String, dynamic> json) =>
      _$MerchantOperationalHourItemFromJson(json);
}
