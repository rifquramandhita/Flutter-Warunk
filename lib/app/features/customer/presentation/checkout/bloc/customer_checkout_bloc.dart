import 'package:flutter_bloc/flutter_bloc.dart';

part 'customer_checkout_event.dart';
part 'customer_checkout_state.dart';

class CustomerCheckoutBloc extends Bloc<CustomerCheckoutEvent, CustomerCheckoutState> {
  CustomerCheckoutBloc() : super(const CustomerCheckoutState()) {
    on<CustomerCheckoutDeliveryChanged>((event, emit) {
      emit(state.copyWith(deliveryMethod: event.index));
    });
    on<CustomerCheckoutVoucherRemoved>((event, emit) {
      emit(state.copyWith(hasVoucher: false));
    });
  }
}
