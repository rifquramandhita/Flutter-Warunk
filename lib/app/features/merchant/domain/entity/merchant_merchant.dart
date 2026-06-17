import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_account.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_operational_hour_item.dart';

part 'merchant_merchant.freezed.dart';
part 'merchant_merchant.g.dart';

@freezed
sealed class MerchantMerchant with _$MerchantMerchant {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory MerchantMerchant.entity({
    required String id,
    required String name,
    required String slug,
    int? userId,
    String? merchantCategoryId,
    String? merchantCategory,
    String? status,
    int? statusChangedBy,
    @JsonKey(name: 'whatsapp_number') String? phone,
    bool? isOpenAllDay,
    @JsonKey(name: 'is_open_24_hours') bool? isOpen24Hours,
    String? timeOpen,
    String? timeClose,
    bool? internalCourier,
    int? internalCourierShippingCost,
    bool? instantCourier,
    bool? pickupAtStore,
    int? maxDistanceInternalCourier,
    @Default([]) List<String> courierCodeAvailable,
    @Default([]) List<MerchantAccountEntity> merchantAccounts,
    @Default([]) List<MerchantOperationalHourItemEntity> merchantOpens,
    String? address,
    String? province,
    String? city,
    String? district,
    String? postalCode,
    double? longitude,
    double? latitude,
    String? photo,
    int? balance,
    bool? isActive,
    required bool isOpen,
  }) = MerchantMerchantEntity;

  @JsonSerializable(includeIfNull: false)
  const factory MerchantMerchant.updateParam({
    @JsonKey(includeFromJson: false, includeToJson: false) File? photo,
    required String name,
    required String slug,
    String? merchantCategoryName,
    String? whatsappNumber,
  }) = MerchantMerchantUpdateParam;

  factory MerchantMerchant.fromJson(Map<String, dynamic> json) =>
      _$MerchantMerchantFromJson(json);
}
