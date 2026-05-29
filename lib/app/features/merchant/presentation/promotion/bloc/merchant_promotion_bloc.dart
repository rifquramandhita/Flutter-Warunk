import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_promotion.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_promotion_add_use_case.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_promotion_delete_use_case.dart';

part 'merchant_promotion_event.dart';
part 'merchant_promotion_state.dart';

class MerchantPromotionBloc extends Bloc<MerchantPromotionEvent, MerchantPromotionState> {
  final MerchantPromotionAddUseCase useCase;
  final MerchantPromotionDeleteUseCase deleteUseCase;

  MerchantPromotionBloc({
    required this.useCase,
    required this.deleteUseCase,
  }) : super(const MerchantPromotionState()) {
    on<MerchantPromotionEventTabChanged>(_onTabChanged);
    on<MerchantPromotionEventToggled>(_onToggled);
    on<MerchantPromotionEventFetched>(_onFetched);
    on<MerchantPromotionEventDeleted>(_onDeleted);
  }

  void _onTabChanged(
    MerchantPromotionEventTabChanged event,
    Emitter<MerchantPromotionState> emit,
  ) {
    emit(state.copyWith(selectedTab: event.index));
  }

  void _onToggled(
    MerchantPromotionEventToggled event,
    Emitter<MerchantPromotionState> emit,
  ) {
    final updated = state.allPromos.map<MerchantPromotionEntity>((p) {
      if (p.id == event.promoId && p is MerchantPromotionEntity) {
        return MerchantPromotion.entity(
          id: p.id,
          code: p.code,
          title: p.title,
          isShow: !p.isShow,
          isPromotionNational: p.isPromotionNational,
          isAllMerchant: p.isAllMerchant,
          type: p.type,
          typeLabel: p.typeLabel,
          datetimeStart: p.datetimeStart,
          datetimeEnd: p.datetimeEnd,
          discountType: p.discountType,
          discountTypeLabel: p.discountTypeLabel,
          discount: p.discount,
          discountLabel: p.discountLabel,
          minPurchase: p.minPurchase,
          maxDiscount: p.maxDiscount,
          eligibility: p.eligibility,
          eligibilityLabel: p.eligibilityLabel,
          isUnlimitedUse: p.isUnlimitedUse,
          maxUse: p.maxUse,
          merchantAssignments: p.merchantAssignments,
          productAssignments: p.productAssignments,
          createdAt: p.createdAt,
          updatedAt: p.updatedAt,
        ) as MerchantPromotionEntity;
      }
      return p;
    }).toList();
    emit(state.copyWith(allPromos: updated));
  }

  Future<void> _onFetched(
    MerchantPromotionEventFetched event,
    Emitter<MerchantPromotionState> emit,
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

  Future<void> _onDeleted(
    MerchantPromotionEventDeleted event,
    Emitter<MerchantPromotionState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await deleteUseCase(event.promoId);

    if (result.success) {
      // Remove deleted item from state locally
      final updated = state.allPromos.where((p) => p.id != event.promoId).toList();
      emit(state.copyWith(
        isLoading: false,
        isSuccess: true,
        allPromos: updated,
      ));
    } else {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: (result.message.isNotEmpty) ? result.message : 'Gagal menghapus promo',
      ));
    }
  }
}
