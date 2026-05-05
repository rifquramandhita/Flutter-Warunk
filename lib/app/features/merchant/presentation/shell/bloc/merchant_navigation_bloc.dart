import 'package:flutter_bloc/flutter_bloc.dart';

part 'merchant_navigation_event.dart';
part 'merchant_navigation_state.dart';

class MerchantNavigationBloc
    extends Bloc<MerchantNavigationEvent, MerchantNavigationState> {
  MerchantNavigationBloc() : super(const MerchantNavigationState()) {
    on<MerchantNavigationTabChanged>((event, emit) {
      emit(state.copyWith(currentIndex: event.index));
    });
  }
}
