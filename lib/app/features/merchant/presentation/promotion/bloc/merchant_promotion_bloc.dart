import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_promotion.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_promotion_national.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_promotion_add_use_case.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_promotion_delete_use_case.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_promotion_get_national_use_case.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_promotion_join_national_use_case.dart';
import 'package:warunk/core/network/data_state.dart';

part 'merchant_promotion_event.dart';
part 'merchant_promotion_state.dart';

class MerchantPromotionBloc
    extends Bloc<MerchantPromotionEvent, MerchantPromotionState> {
  final MerchantPromotionAddUseCase useCase;
  final MerchantPromotionDeleteUseCase deleteUseCase;
  final MerchantPromotionGetNationalUseCase getNationalUseCase;
  final MerchantPromotionJoinNationalUseCase joinNationalUseCase;

  MerchantPromotionBloc({
    required this.useCase, 
    required this.deleteUseCase,
    required this.getNationalUseCase,
    required this.joinNationalUseCase,
  })
    : super(const MerchantPromotionState()) {
    on<MerchantPromotionEventTabChanged>(_onTabChanged);
    on<MerchantPromotionEventGet>(_onGet);
    on<MerchantPromotionEventDeleted>(_onDeleted);
    on<MerchantPromotionEventJoinNational>(_onJoinNational);
  }

  void _onTabChanged(
    MerchantPromotionEventTabChanged event,
    Emitter<MerchantPromotionState> emit,
  ) {
    emit(state.copyWith(selectedTab: event.index));
  }

  Future<void> _onGet(
    MerchantPromotionEventGet event,
    Emitter<MerchantPromotionState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final results = await Future.wait([
      useCase(),
      getNationalUseCase(),
    ]);

    final result = results[0] as DataState<List<MerchantPromotionEntity>>;
    final nationalResult = results[1] as DataState<List<MerchantPromotionNationalEntity>>;

    if (result.success && result.data != null) {
      emit(state.copyWith(
        allPromos: result.data!,
        nationalPromos: nationalResult.success && nationalResult.data != null ? nationalResult.data! : [],
      ));
    } else {
      emit(
        state.copyWith(
          errorMessage: (result.message.isNotEmpty)
              ? result.message
              : 'Gagal mengambil promo',
        ),
      );
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
      final updated = state.allPromos
          .where((p) => p.id != event.promoId)
          .toList();
      emit(
        state.copyWith(isLoading: false, isSuccess: true, allPromos: updated),
      );
    } else {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: (result.message.isNotEmpty)
              ? result.message
              : 'Gagal menghapus promo',
        ),
      );
    }
  }

  Future<void> _onJoinNational(
    MerchantPromotionEventJoinNational event,
    Emitter<MerchantPromotionState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await joinNationalUseCase(event.promoId);

    if (result.success) {
      emit(state.copyWith(isLoading: false, isJoinSuccess: true, joinUrl: event.joinUrl));
    } else {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: (result.message.isNotEmpty)
              ? result.message
              : 'Gagal mengikuti promo nasional',
        ),
      );
    }
  }
}
