import 'package:flutter_bloc/flutter_bloc.dart';

part 'merchant_delivery_method_event.dart';
part 'merchant_delivery_method_state.dart';

class MerchantDeliveryMethodBloc
    extends Bloc<MerchantDeliveryMethodEvent, MerchantDeliveryMethodState> {
  MerchantDeliveryMethodBloc() : super(const MerchantDeliveryMethodState()) {
    on<MerchantDeliveryMethodToggled>((event, emit) {
      final newMethods = state.methods.map((e) {
        if (e.id == event.id) {
          return e.copyWith(isActive: !e.isActive);
        }
        return e;
      }).toList();
      emit(state.copyWith(methods: newMethods));
    });

    on<MerchantDeliveryMethodSaved>((event, emit) async {
      emit(state.copyWith(isSaving: true));
      await Future<void>.delayed(const Duration(milliseconds: 800));
      emit(state.copyWith(isSaving: false, isSaved: true));
    });
  }
}
