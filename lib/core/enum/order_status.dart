import 'package:freezed_annotation/freezed_annotation.dart';

enum OrderStatus {
  @JsonValue('waiting_payment')
  waitingPayment,
  @JsonValue('waiting_payment_confirmation')
  waitingPaymentConfirmation,
  @JsonValue('waiting_cancel')
  waitingCancel,
  @JsonValue('processing')
  processing,
  @JsonValue('shipped')
  shipped,
  @JsonValue('received')
  received,
  @JsonValue('completed')
  completed,
  @JsonValue('cancelled')
  cancelled;

  String get label {
    switch (this) {
      case OrderStatus.waitingPayment:
        return 'Menunggu Pembayaran';
      case OrderStatus.waitingPaymentConfirmation:
        return 'Menunggu Konfirmasi Pembayaran';
      case OrderStatus.waitingCancel:
        return 'Menunggu Pembatalan';
      case OrderStatus.processing:
        return 'Diproses';
      case OrderStatus.shipped:
        return 'Dikirim';
      case OrderStatus.received:
        return 'Diterima';
      case OrderStatus.completed:
        return 'Selesai';
      case OrderStatus.cancelled:
        return 'Dibatalkan';
    }
  }

  String get value {
    switch (this) {
      case OrderStatus.waitingPayment:
        return 'waiting_payment';
      case OrderStatus.waitingPaymentConfirmation:
        return 'waiting_payment_confirmation';
      case OrderStatus.waitingCancel:
        return 'waiting_cancel';
      case OrderStatus.processing:
        return 'processing';
      case OrderStatus.shipped:
        return 'shipped';
      case OrderStatus.received:
        return 'received';
      case OrderStatus.completed:
        return 'completed';
      case OrderStatus.cancelled:
        return 'cancelled';
    }
  }

  static OrderStatus? fromString(String? value) {
    if (value == null) return null;
    try {
      return OrderStatus.values.firstWhere((e) => e.value == value);
    } catch (_) {
      return null;
    }
  }
}
