import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_cart.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_cart_get_use_case.dart';

part 'customer_cart_event.dart';
part 'customer_cart_state.dart';

class CustomerCartBloc extends Bloc<CustomerCartEvent, CustomerCartState> {
  final CustomerCartGetUseCase _getUseCase;

  CustomerCartBloc({required CustomerCartGetUseCase getUseCase})
    : _getUseCase = getUseCase,
      super(const CustomerCartState(items: [])) {
    on<CustomerCartEventFetch>(_onFetch);
    on<CustomerCartEventQtyChanged>(_onQtyChanged);
    on<CustomerCartEventItemRemoved>(_onItemRemoved);
    on<CustomerCartEventNoteChanged>(_onNoteChanged);
  }

  Future<void> _onFetch(
    CustomerCartEventFetch event,
    Emitter<CustomerCartState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final result = await _getUseCase();
    if (result.success && result.data != null) {
      emit(state.copyWith(isLoading: false, items: result.data));
    } else {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: result.message.isNotEmpty
              ? result.message
              : 'Failed to fetch cart',
        ),
      );
    }
  }

  void _onQtyChanged(
    CustomerCartEventQtyChanged event,
    Emitter<CustomerCartState> emit,
  ) {
    final items = List<CustomerCartEntity>.from(state.items);
    final item = items[event.index];
    final newQty = item.quantity + event.delta;
    if (newQty < 1) return;
    items[event.index] = item.copyWith(quantity: newQty);
    emit(state.copyWith(items: items));
  }

  void _onItemRemoved(
    CustomerCartEventItemRemoved event,
    Emitter<CustomerCartState> emit,
  ) {
    final items = List<CustomerCartEntity>.from(state.items)
      ..removeAt(event.index);
    emit(state.copyWith(items: items));
  }

  void _onNoteChanged(
    CustomerCartEventNoteChanged event,
    Emitter<CustomerCartState> emit,
  ) {
    emit(state.copyWith(note: event.note));
  }
}
