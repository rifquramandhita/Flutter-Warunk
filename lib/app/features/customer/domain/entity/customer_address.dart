import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_address.freezed.dart';
part 'customer_address.g.dart';

@freezed
sealed class CustomerAddress with _$CustomerAddress {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory CustomerAddress.entity({
    required String id,
    required int userId,
    required String recipientName,
    required String phone,
    required String label,
    required String address,
    required String province,
    required String city,
    required String district,
    required String postalCode,
    required double longitude,
    required double latitude,
    String? notes,
    required bool isDefault,
    required String fullAddress,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = CustomerAddressEntity;

  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory CustomerAddress.sendParam({
    @JsonKey(includeToJson: false, includeFromJson: false) String? id,
    required String recipientName,
    required String phone,
    required String label,
    required String address,
    required String province,
    required String city,
    required String district,
    required String postalCode,
    required double longitude,
    required double latitude,
    String? notes,
    required bool isDefault,
  }) = CustomerAddressSendParam;

  factory CustomerAddress.fromJson(Map<String, dynamic> json) =>
      _$CustomerAddressFromJson(json);
}
