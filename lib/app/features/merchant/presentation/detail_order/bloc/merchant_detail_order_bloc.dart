import 'package:flutter_bloc/flutter_bloc.dart';

part 'merchant_detail_order_event.dart';
part 'merchant_detail_order_state.dart';

class MerchantDetailOrderBloc
    extends Bloc<MerchantDetailOrderEvent, MerchantDetailOrderState> {
  MerchantDetailOrderBloc() : super(const MerchantDetailOrderState()) {
    on<MerchantDetailOrderMapsTapped>((event, emit) {
      // TODO: open maps
    });
  }
}
