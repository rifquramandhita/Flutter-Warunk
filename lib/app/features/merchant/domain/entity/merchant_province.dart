import 'package:freezed_annotation/freezed_annotation.dart';

part 'merchant_province.freezed.dart';
part 'merchant_province.g.dart';

@freezed
sealed class MerchantProvince with _$MerchantProvince {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory MerchantProvince.entity({
    required int id,
    required String code,
    required String name,
  }) = MerchantProvinceEntity;

  factory MerchantProvince.fromJson(Map<String, dynamic> json) =>
      _$MerchantProvinceFromJson(json);
}

typedef RegionProvinceEntity = MerchantProvinceEntity;
typedef ProvinceEntity = MerchantProvinceEntity;
