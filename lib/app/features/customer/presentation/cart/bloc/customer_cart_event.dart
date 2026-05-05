part of 'customer_cart_bloc.dart';

abstract class CustomerCartEvent {}

class CustomerCartQtyChanged extends CustomerCartEvent {
  final int index;
  final int delta; // +1 or -1
  CustomerCartQtyChanged(this.index, this.delta);
}

class CustomerCartItemRemoved extends CustomerCartEvent {
  final int index;
  CustomerCartItemRemoved(this.index);
}

class CustomerCartNoteChanged extends CustomerCartEvent {
  final String note;
  CustomerCartNoteChanged(this.note);
}
