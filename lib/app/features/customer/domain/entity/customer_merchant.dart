import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_merchant.freezed.dart';
part 'customer_merchant.g.dart';

@freezed
sealed class CustomerMerchant with _$CustomerMerchant {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory CustomerMerchant.entity({
    required String id,
    required String name,
    required String slug,
    String? photo,
    required bool isActive,
    required bool isOpen,
    int? userId,
    String? merchantCategory,
    String? status,
    int? statusChangedBy,
    String? whatsappNumber,
    bool? isOpenAllDay,
    @JsonKey(name: 'is_open_24_hours') bool? isOpen24Hours,
    String? timeOpen,
    String? timeClose,
    bool? internalCourier,
    bool? instantCourier,
    bool? pickupAtStore,
    List<String>? courierCodeAvailable,
    int? maxDistanceInternalCourier,
    List<CustomerMerchantAccountEntity>? merchantAccounts,
    List<CustomerMerchantOpenEntity>? merchantOpens,
    String? address,
    String? province,
    String? city,
    String? district,
    String? postalCode,
    double? longitude,
    double? latitude,
    int? balance,
    int? currentBalance,
    double? distance,
    List<String>? promoBadges,
    CustomerMerchantUserEntity? user,
    String? chatUrl,
  }) = CustomerMerchantEntity;

  factory CustomerMerchant.fromJson(Map<String, dynamic> json) =>
      _$CustomerMerchantFromJson(json);
}

@freezed
sealed class CustomerMerchantAccount with _$CustomerMerchantAccount {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory CustomerMerchantAccount.entity({
    required String id,
    required String bankName,
    required String accountName,
    required String accountNumber,
  }) = CustomerMerchantAccountEntity;

  factory CustomerMerchantAccount.fromJson(Map<String, dynamic> json) =>
      _$CustomerMerchantAccountFromJson(json);
}

@freezed
sealed class CustomerMerchantOpen with _$CustomerMerchantOpen {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory CustomerMerchantOpen.entity({
    required String id,
    required String day,
    required bool isClosed,
    @JsonKey(name: 'is_open_24_hours') required bool isOpen24Hours,
    String? timeOpen,
    String? timeClose,
  }) = CustomerMerchantOpenEntity;

  factory CustomerMerchantOpen.fromJson(Map<String, dynamic> json) =>
      _$CustomerMerchantOpenFromJson(json);
}

@freezed
sealed class CustomerMerchantUser with _$CustomerMerchantUser {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory CustomerMerchantUser.entity({
    required int id,
    required String name,
    required String email,
    required String phone,
    String? profilePhoto,
  }) = CustomerMerchantUserEntity;

  factory CustomerMerchantUser.fromJson(Map<String, dynamic> json) =>
      _$CustomerMerchantUserFromJson(json);
}
