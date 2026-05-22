// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantAccountEntity _$MerchantAccountEntityFromJson(
  Map<String, dynamic> json,
) => MerchantAccountEntity(
  id: json['id'] as String,
  bankName: json['bank_name'] as String,
  accountName: json['account_name'] as String,
  accountNumber: json['account_number'] as String,
);

Map<String, dynamic> _$MerchantAccountEntityToJson(
  MerchantAccountEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'bank_name': instance.bankName,
  'account_name': instance.accountName,
  'account_number': instance.accountNumber,
};
