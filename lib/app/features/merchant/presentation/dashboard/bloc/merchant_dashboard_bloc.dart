import 'package:flutter_bloc/flutter_bloc.dart';

part 'merchant_dashboard_event.dart';
part 'merchant_dashboard_state.dart';

class MerchantDashboardBloc
    extends Bloc<MerchantDashboardEvent, MerchantDashboardState> {
  MerchantDashboardBloc() : super(const MerchantDashboardState()) {
    on<MerchantDashboardPeriodChanged>((event, emit) {
      emit(state.copyWith(selectedPeriod: event.period));
    });
  }
}
