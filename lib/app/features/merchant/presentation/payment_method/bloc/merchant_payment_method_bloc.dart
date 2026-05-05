import 'package:flutter_bloc/flutter_bloc.dart';

part 'merchant_payment_method_event.dart';
part 'merchant_payment_method_state.dart';

class MerchantPaymentMethodBloc
    extends Bloc<MerchantPaymentMethodEvent, MerchantPaymentMethodState> {
  MerchantPaymentMethodBloc() : super(const MerchantPaymentMethodState()) {
    on<MerchantPaymentMethodToggled>((event, emit) {
      final newMethods = state.methods.map((e) {
        if (e.id == event.id) {
          return e.copyWith(isActive: !e.isActive);
        }
        return e;
      }).toList();
      emit(state.copyWith(methods: newMethods));
    });
  }
}
