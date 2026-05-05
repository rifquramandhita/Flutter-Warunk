import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'customer_home_event.dart';
part 'customer_home_state.dart';

class CustomerHomeBloc extends Bloc<CustomerHomeEvent, CustomerHomeState> {
  CustomerHomeBloc() : super(const CustomerHomeState()) {
    on<CustomerHomeBannerChanged>(_onBannerChanged);
  }

  void _onBannerChanged(
    CustomerHomeBannerChanged event,
    Emitter<CustomerHomeState> emit,
  ) {
    emit(state.copyWith(currentBanner: event.index));
  }
}
