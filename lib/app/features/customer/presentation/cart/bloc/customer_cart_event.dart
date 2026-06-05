part of 'customer_cart_bloc.dart';

sealed class CustomerCartEvent {
  const CustomerCartEvent();
}

final class CustomerCartEventGet extends CustomerCartEvent {
  const CustomerCartEventGet();
}

final class CustomerCartEventQtyChanged extends CustomerCartEvent {
  final int index;
  final int delta; // +1 or -1

  const CustomerCartEventQtyChanged(this.index, this.delta);
}

final class CustomerCartEventItemRemoved extends CustomerCartEvent {
  final int index;

  const CustomerCartEventItemRemoved(this.index);
}

final class CustomerCartEventNoteChanged extends CustomerCartEvent {
  final String note;

  const CustomerCartEventNoteChanged(this.note);
}

final class CustomerCartEventMerchantToggled extends CustomerCartEvent {
  final String merchantId;
  final bool isSelected;

  const CustomerCartEventMerchantToggled(this.merchantId, this.isSelected);
}

final class CustomerCartEventItemToggled extends CustomerCartEvent {
  final String itemId;
  final String merchantId;
  final bool isSelected;

  const CustomerCartEventItemToggled(
    this.itemId,
    this.merchantId,
    this.isSelected,
  );
}
