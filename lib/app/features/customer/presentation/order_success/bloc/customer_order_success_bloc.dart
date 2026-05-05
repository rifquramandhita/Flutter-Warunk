import 'package:flutter_bloc/flutter_bloc.dart';
import 'customer_order_success_event.dart';
import 'customer_order_success_state.dart';

class CustomerOrderSuccessBloc extends Bloc<CustomerOrderSuccessEvent, CustomerOrderSuccessState> {
  CustomerOrderSuccessBloc() : super(const CustomerOrderSuccessState()) {
    on<CustomerLoadOrderSuccessData>(_onLoadOrderSuccessData);
  }

  void _onLoadOrderSuccessData(CustomerLoadOrderSuccessData event, Emitter<CustomerOrderSuccessState> emit) {
    emit(state.copyWith(isLoading: true));
    emit(state.copyWith(
      isLoading: false,
      orderId: '#WRK-240128-018',
    ));
  }
}
