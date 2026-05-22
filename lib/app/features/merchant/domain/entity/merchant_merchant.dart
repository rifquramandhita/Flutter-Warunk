import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_account.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_category.dart';

part 'merchant_merchant.freezed.dart';
part 'merchant_merchant.g.dart';

@freezed
sealed class MerchantMerchant with _$MerchantMerchant {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory MerchantMerchant.entity({
    required String id,
    required String name,
    required String slug,
    int? userId,
    String? merchantCategoryId,
    MerchantCategoryEntity? merchantCategory,
    String? status,
    int? statusChangedBy,
    @JsonKey(name: 'whatsapp_number') String? phone,
    bool? isOpenAllDay,
    bool? isOpen24Hours,
    String? timeOpen,
    String? timeClose,
    bool? internalCourier,
    bool? instantCourier,
    bool? pickupAtStore,
    int? maxDistanceInternalCourier,
    @Default([]) List<MerchantAccountEntity> merchantAccounts,
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

  factory MerchantMerchant.fromJson(Map<String, dynamic> json) =>
      _$MerchantMerchantFromJson(json);
}
