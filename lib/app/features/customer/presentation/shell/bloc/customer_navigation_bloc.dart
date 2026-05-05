import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'customer_navigation_event.dart';
part 'customer_navigation_state.dart';

class CustomerNavigationBloc extends Bloc<CustomerNavigationEvent, CustomerNavigationState> {
  CustomerNavigationBloc() : super(const CustomerNavigationState()) {
    on<CustomerNavigationTabChanged>(_onTabChanged);
  }

  void _onTabChanged(
    CustomerNavigationTabChanged event,
    Emitter<CustomerNavigationState> emit,
  ) {
    emit(state.copyWith(currentIndex: event.index));
  }
}
