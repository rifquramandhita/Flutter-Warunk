import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_merchant.freezed.dart';
part 'sales_merchant.g.dart';

@freezed
abstract class SalesMerchantEntity with _$SalesMerchantEntity {
  const factory SalesMerchantEntity({
    required String id,
    required String name,
    required String slug,
    @JsonKey(name: 'whatsapp_number') String? whatsappNumber,
    required String address,
    @JsonKey(name: 'district_id') required int districtId,
    required String province,
    required String city,
    required String district,
    String? photo,
    @JsonKey(name: 'sales_id') int? salesId,
    @JsonKey(name: 'sales_name') String? salesName,
    @JsonKey(name: 'is_claimed') required bool isClaimed,
    @JsonKey(name: 'is_claimed_by_me') required bool isClaimedByMe,
    @JsonKey(name: 'can_login_as_merchant') required bool canLoginAsMerchant,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _SalesMerchantEntity;

  factory SalesMerchantEntity.fromJson(Map<String, dynamic> json) =>
      _$SalesMerchantEntityFromJson(json);
}

@freezed
abstract class SalesMerchantResponseEntity with _$SalesMerchantResponseEntity {
  const factory SalesMerchantResponseEntity({
    @Default([]) List<SalesMerchantEntity> merchants,
    Map<String, dynamic>? pagination,
  }) = _SalesMerchantResponseEntity;

  factory SalesMerchantResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$SalesMerchantResponseEntityFromJson(json);
}
