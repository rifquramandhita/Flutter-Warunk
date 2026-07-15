import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_cart_get_use_case.dart';

part 'customer_shell_event.dart';
part 'customer_shell_state.dart';

class CustomerShellBloc extends Bloc<CustomerShellEvent, CustomerShellState> {
  final CustomerCartGetUseCase _cartGetUseCase;

  CustomerShellBloc({required CustomerCartGetUseCase cartGetUseCase})
      : _cartGetUseCase = cartGetUseCase,
        super(const CustomerShellState()) {
    on<CustomerShellTabChanged>(_onTabChanged);
    on<CustomerShellLoadCartCount>(_onLoadCartCount);
  }

  void _onTabChanged(
    CustomerShellTabChanged event,
    Emitter<CustomerShellState> emit,
  ) {
    emit(state.copyWith(currentIndex: event.index));
  }

  Future<void> _onLoadCartCount(
    CustomerShellLoadCartCount event,
    Emitter<CustomerShellState> emit,
  ) async {
    final result = await _cartGetUseCase();
    if (result.data != null) {
      emit(state.copyWith(cartCount: result.data!.length));
    }
  }
}
