import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_payment_method_entity.freezed.dart';

@freezed
abstract class CustomerPaymentMethodEntity with _$CustomerPaymentMethodEntity {
  const factory CustomerPaymentMethodEntity({
    required String name,
    required String subtitle,
    required int colorValue,
    required int iconCodePoint,
  }) = _CustomerPaymentMethodEntity;
}
