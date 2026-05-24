import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_operational_hour_item.dart';

part 'merchant_operational_hour.freezed.dart';
part 'merchant_operational_hour.g.dart';

@freezed
sealed class MerchantOperationalHour with _$MerchantOperationalHour {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    explicitToJson: true,
    includeIfNull: false,
  )
  const factory MerchantOperationalHour.updateParam({
    required bool isOpenAllDay,
    @JsonKey(name: 'is_open_24_hours') required bool isOpen24Hours,
    String? timeOpen,
    String? timeClose,
    List<MerchantOperationalHourItemUpdateParam>? merchantOpens,
  }) = MerchantOperationalHourUpdateParam;

  factory MerchantOperationalHour.fromJson(Map<String, dynamic> json) =>
      _$MerchantOperationalHourFromJson(json);
}
