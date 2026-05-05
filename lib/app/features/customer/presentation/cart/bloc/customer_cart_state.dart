part of 'customer_cart_bloc.dart';

class CustomerCartState {
  final List<CustomerCartItemEntity> items;
  final String note;

  static const int serviceFee = 2000;
  static const int ongkir     = 8000;
  static const int diskon     = 8000;

  int get subtotal  => items.fold(0, (s, i) => s + i.unitPrice * i.qty);
  int get itemCount => items.fold(0, (s, i) => s + i.qty);
  int get total     => subtotal + serviceFee + ongkir - diskon;

  const CustomerCartState({required this.items, this.note = ''});

  CustomerCartState copyWith({List<CustomerCartItemEntity>? items, String? note}) => CustomerCartState(
        items: items ?? this.items,
        note: note ?? this.note,
      );
}
