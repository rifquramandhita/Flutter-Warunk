import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'sales_shell_event.dart';
part 'sales_shell_state.dart';

class SalesShellBloc extends Bloc<SalesShellEvent, SalesShellState> {
  SalesShellBloc() : super(const SalesShellState()) {
    on<SalesShellTabChanged>(_onTabChanged);
  }

  void _onTabChanged(
    SalesShellTabChanged event,
    Emitter<SalesShellState> emit,
  ) {
    emit(state.copyWith(currentIndex: event.index));
  }
}
