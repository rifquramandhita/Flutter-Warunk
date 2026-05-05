import 'package:flutter_bloc/flutter_bloc.dart';

part 'merchant_promo_event.dart';
part 'merchant_promo_state.dart';

class MerchantPromoBloc extends Bloc<MerchantPromoEvent, MerchantPromoState> {
  MerchantPromoBloc() : super(const MerchantPromoState()) {
    on<MerchantPromoTabChanged>((event, emit) {
      emit(state.copyWith(selectedTab: event.index));
    });

    on<MerchantPromoToggled>((event, emit) {
      final updated = state.allPromos.map((p) {
        return p.id == event.promoId ? p.copyWith(isActive: !p.isActive) : p;
      }).toList();
      emit(state.copyWith(allPromos: updated));
    });
  }
}
