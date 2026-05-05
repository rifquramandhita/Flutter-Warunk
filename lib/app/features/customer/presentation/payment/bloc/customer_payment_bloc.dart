import 'package:flutter_bloc/flutter_bloc.dart';

part 'customer_payment_event.dart';
part 'customer_payment_state.dart';

class CustomerPaymentBloc extends Bloc<CustomerPaymentEvent, CustomerPaymentState> {
  CustomerPaymentBloc() : super(const CustomerPaymentState()) {
    on<CustomerPaymentMethodSelected>((event, emit) {
      emit(state.copyWith(selectedIndex: event.index));
    });
  }
}
