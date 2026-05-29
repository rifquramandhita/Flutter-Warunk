import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'customer_shell_event.dart';
part 'customer_shell_state.dart';

class CustomerShellBloc extends Bloc<CustomerShellEvent, CustomerShellState> {
  CustomerShellBloc() : super(const CustomerShellState()) {
    on<CustomerShellTabChanged>(_onTabChanged);
  }

  void _onTabChanged(
    CustomerShellTabChanged event,
    Emitter<CustomerShellState> emit,
  ) {
    emit(state.copyWith(currentIndex: event.index));
  }
}
