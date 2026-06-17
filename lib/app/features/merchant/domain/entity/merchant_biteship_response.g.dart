// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_biteship_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantBiteshipResponseEntity _$MerchantBiteshipResponseEntityFromJson(
  Map<String, dynamic> json,
) => MerchantBiteshipResponseEntity(
  id: json['id'] as String?,
  price: json['price'] as num?,
  object: json['object'] as String?,
  status: json['status'] as String?,
  message: json['message'] as String?,
  success: json['success'] as bool?,
  currency: json['currency'] as String?,
  referenceId: json['reference_id'] as String?,
  draftOrderId: json['draft_order_id'] as String?,
  courier: json['courier'] == null
      ? null
      : MerchantBiteshipResponseCourierEntity.fromJson(
          json['courier'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$MerchantBiteshipResponseEntityToJson(
  MerchantBiteshipResponseEntity instance,
) => <String, dynamic>{
  'id': ?instance.id,
  'price': ?instance.price,
  'object': ?instance.object,
  'status': ?instance.status,
  'message': ?instance.message,
  'success': ?instance.success,
  'currency': ?instance.currency,
  'reference_id': ?instance.referenceId,
  'draft_order_id': ?instance.draftOrderId,
  'courier': ?instance.courier,
};
