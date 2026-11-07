import 'package:freezed_annotation/freezed_annotation.dart';

part 'merchant_regency.freezed.dart';
part 'merchant_regency.g.dart';

@freezed
sealed class MerchantRegency with _$MerchantRegency {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory MerchantRegency.entity({
    required int id,
    required int provinceId,
    required String code,
    required String name,
    String? type,
  }) = MerchantRegencyEntity;

  factory MerchantRegency.fromJson(Map<String, dynamic> json) =>
      _$MerchantRegencyFromJson(json);
}

typedef RegionRegencyEntity = MerchantRegencyEntity;
typedef RegencyEntity = MerchantRegencyEntity;
