import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_transaction_entity.freezed.dart';

enum TxStatus { diproses, menungguBayar, dikirim, selesai, dibatalkan }

@freezed
abstract class CustomerTransactionEntity with _$CustomerTransactionEntity {
  const factory CustomerTransactionEntity({
    required String id,
    required String storeName,
    required Color storeColor1,
    required Color storeColor2,
    required int itemCount,
    required int total,
    required TxStatus status,
    required String dateLabel,
    String? orderId,
  }) = _CustomerTransactionEntity;
}
