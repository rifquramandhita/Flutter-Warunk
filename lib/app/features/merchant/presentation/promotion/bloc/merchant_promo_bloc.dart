import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_promotion.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_promotion_add_use_case.dart';

part 'merchant_promo_event.dart';
part 'merchant_promo_state.dart';

class MerchantPromoBloc extends Bloc<MerchantPromoEvent, MerchantPromoState> {
  final MerchantPromotionAddUseCase useCase;

  MerchantPromoBloc({required this.useCase}) : super(const MerchantPromoState()) {
    on<MerchantPromoEventTabChanged>(_onTabChanged);
    on<MerchantPromoEventToggled>(_onToggled);
    on<MerchantPromoEventFetched>(_onFetched);
  }

  void _onTabChanged(
    MerchantPromoEventTabChanged event,
    Emitter<MerchantPromoState> emit,
  ) {
    emit(state.copyWith(selectedTab: event.index));
  }

  void _onToggled(
    MerchantPromoEventToggled event,
    Emitter<MerchantPromoState> emit,
  ) {
    final updated = state.allPromos.map((p) {
      return p.id == event.promoId ? p.copyWith(isShow: !p.isShow) : p;
    }).toList();
    emit(state.copyWith(allPromos: updated));
  }

  Future<void> _onFetched(
    MerchantPromoEventFetched event,
    Emitter<MerchantPromoState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await useCase();

    if (result.success && result.data != null) {
      emit(state.copyWith(allPromos: result.data!));
    } else {
      emit(state.copyWith(
        errorMessage: (result.message.isNotEmpty) ? result.message : 'Gagal mengambil promo',
      ));
    }
    
    emit(state.copyWith(isLoading: false));
  }
}
