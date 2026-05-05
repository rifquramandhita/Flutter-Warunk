import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_cart_item_entity.freezed.dart';

@freezed
abstract class CustomerCartItemEntity with _$CustomerCartItemEntity {
  const factory CustomerCartItemEntity({
    required String name,
    required String subtitle,
    required int unitPrice,
    required IconData icon,
    required Color color,
    required int qty,
  }) = _CustomerCartItemEntity;
}
