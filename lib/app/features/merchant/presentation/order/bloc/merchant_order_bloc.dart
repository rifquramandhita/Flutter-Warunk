import 'package:flutter_bloc/flutter_bloc.dart';

part 'merchant_order_event.dart';
part 'merchant_order_state.dart';

class MerchantOrderBloc
    extends Bloc<MerchantOrderEvent, MerchantOrderState> {
  MerchantOrderBloc() : super(const MerchantOrderState()) {
    on<MerchantOrderTabChanged>((event, emit) {
      emit(state.copyWith(selectedTab: event.index));
    });

    on<MerchantOrderFilterTapped>((event, emit) {
      // TODO: show filter bottom sheet
    });
  }
}
