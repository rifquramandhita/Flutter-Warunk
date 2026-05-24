import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_operational_hour_item.dart';

part 'merchant_operational_hour.freezed.dart';
part 'merchant_operational_hour.g.dart';

@freezed
sealed class MerchantOperationalHour with _$MerchantOperationalHour {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory MerchantOperationalHour.updateParam({
    required bool isOpenAllDay,
    required bool isOpen24Hours,
    required String timeOpen,
    required String timeClose,
    required List<MerchantOperationalHourItemUpdateParam> merchantOpens,
  }) = MerchantOperationalHourUpdateParam;

  factory MerchantOperationalHour.fromJson(Map<String, dynamic> json) =>
      _$MerchantOperationalHourFromJson(json);
}
