import 'package:freezed_annotation/freezed_annotation.dart';

part 'merchant_district.freezed.dart';
part 'merchant_district.g.dart';

@freezed
sealed class MerchantDistrict with _$MerchantDistrict {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory MerchantDistrict.entity({
    required int id,
    required int regencyId,
    required String code,
    required String name,
  }) = MerchantDistrictEntity;

  factory MerchantDistrict.fromJson(Map<String, dynamic> json) =>
      _$MerchantDistrictFromJson(json);
}

typedef RegionDistrictEntity = MerchantDistrictEntity;
typedef DistrictEntity = MerchantDistrictEntity;
