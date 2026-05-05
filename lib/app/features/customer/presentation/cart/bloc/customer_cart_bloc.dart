import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_cart_item_entity.dart';
export 'package:warunk/app/features/customer/domain/entity/customer_cart_item_entity.dart';

part 'customer_cart_event.dart';
part 'customer_cart_state.dart';

class CustomerCartBloc extends Bloc<CustomerCartEvent, CustomerCartState> {
  static final _defaultItems = [
    const CustomerCartItemEntity(name: 'Indomie Goreng', subtitle: 'Makanan Instan',        unitPrice: 3500, icon: Icons.ramen_dining_rounded,  color: Color(0xFFFFF8E1), qty: 2),
    const CustomerCartItemEntity(name: 'Teh Botol',      subtitle: 'Teh Botol Sosro 450ml', unitPrice: 4000, icon: Icons.local_drink_rounded,   color: Color(0xFFFFE0E0), qty: 1),
    const CustomerCartItemEntity(name: 'Telur Ayam',     subtitle: 'Telur Ayam Negeri',     unitPrice: 2500, icon: Icons.egg_rounded,           color: Color(0xFFFFF8E1), qty: 1),
    const CustomerCartItemEntity(name: 'Kopi Sachet',    subtitle: 'Kapal Api Special Mix', unitPrice: 1500, icon: Icons.coffee_rounded,        color: Color(0xFFEFEBE9), qty: 3),
  ];

  CustomerCartBloc() : super(CustomerCartState(items: List.from(_defaultItems))) {
    on<CustomerCartQtyChanged>((event, emit) {
      final items = List<CustomerCartItemEntity>.from(state.items);
      final item  = items[event.index];
      final newQty = item.qty + event.delta;
      if (newQty < 1) return;
      items[event.index] = item.copyWith(qty: newQty);
      emit(state.copyWith(items: items));
    });

    on<CustomerCartItemRemoved>((event, emit) {
      final items = List<CustomerCartItemEntity>.from(state.items)..removeAt(event.index);
      emit(state.copyWith(items: items));
    });

    on<CustomerCartNoteChanged>((event, emit) {
      emit(state.copyWith(note: event.note));
    });
  }
}
