part of 'customer_cart_bloc.dart';

abstract class CustomerCartEvent extends Equatable {
  const CustomerCartEvent();

  @override
  List<Object?> get props => [];
}

class CustomerCartEventFetch extends CustomerCartEvent {}

class CustomerCartEventQtyChanged extends CustomerCartEvent {
  final int index;
  final int delta; // +1 or -1

  const CustomerCartEventQtyChanged(this.index, this.delta);

  @override
  List<Object?> get props => [index, delta];
}

class CustomerCartEventItemRemoved extends CustomerCartEvent {
  final int index;

  const CustomerCartEventItemRemoved(this.index);

  @override
  List<Object?> get props => [index];
}

class CustomerCartEventNoteChanged extends CustomerCartEvent {
  final String note;

  const CustomerCartEventNoteChanged(this.note);

  @override
  List<Object?> get props => [note];
}
