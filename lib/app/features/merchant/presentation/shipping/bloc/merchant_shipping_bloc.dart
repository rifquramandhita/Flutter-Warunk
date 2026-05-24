import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_shipping.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_merchant_get_courier_use_case.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_merchant_update_shipping_use_case.dart';

import 'package:warunk/app/features/merchant/domain/use_case/merchant_merchant_get_use_case.dart';

part 'merchant_shipping_event.dart';
part 'merchant_shipping_state.dart';

class MerchantShippingBloc
    extends Bloc<MerchantShippingEvent, MerchantShippingState> {
  final MerchantMerchantGetCourierUseCase _getCourierUseCase;
  final MerchantMerchantUpdateShippingUseCase _updateShippingUseCase;
  final MerchantMerchantGetUseCase _getMerchantUseCase;

  MerchantShippingBloc({
    required MerchantMerchantGetCourierUseCase getCourierUseCase,
    required MerchantMerchantUpdateShippingUseCase updateShippingUseCase,
    required MerchantMerchantGetUseCase getMerchantUseCase,
  }) : _getCourierUseCase = getCourierUseCase,
       _updateShippingUseCase = updateShippingUseCase,
       _getMerchantUseCase = getMerchantUseCase,
       super(const MerchantShippingState()) {
    on<MerchantShippingGet>((event, emit) async {
      emit(state.copyWith(isLoadingData: true, errorMessage: null));

      final courierResult = await _getCourierUseCase();
      final merchantResult = await _getMerchantUseCase();

      if (courierResult.data != null && merchantResult.data != null) {
        final merchant = merchantResult.data!;
        emit(
          state.copyWith(
            isLoadingData: false,
            availableCouriers: courierResult.data,
            pickupAtStore: merchant.pickupAtStore ?? false,
            internalCourier: merchant.internalCourier ?? false,
            instantCourier: merchant.instantCourier ?? false,
            maxDistanceInternalCourier: merchant.maxDistanceInternalCourier ?? 0,
            selectedCouriers: merchant.courierCodeAvailable,
          ),
        );
      } else {
        emit(
          state.copyWith(
            isLoadingData: false,
            errorMessage: courierResult.data == null ? courierResult.message : merchantResult.message,
          ),
        );
      }
    });

    on<MerchantShippingToggleMethod>((event, emit) {
      switch (event.methodKey) {
        case 'pickup_at_store':
          emit(state.copyWith(pickupAtStore: !state.pickupAtStore));
          break;
        case 'internal_courier':
          emit(state.copyWith(internalCourier: !state.internalCourier));
          break;
        case 'instant_courier':
          emit(state.copyWith(instantCourier: !state.instantCourier));
          break;
      }
    });

    on<MerchantShippingUpdateMaxDistance>((event, emit) {
      emit(state.copyWith(maxDistanceInternalCourier: event.maxDistance));
    });

    on<MerchantShippingToggleCourier>((event, emit) {
      final currentSelected = List<String>.from(state.selectedCouriers);
      if (currentSelected.contains(event.courierCode)) {
        currentSelected.remove(event.courierCode);
      } else {
        currentSelected.add(event.courierCode);
      }
      emit(state.copyWith(selectedCouriers: currentSelected));
    });

    on<MerchantShippingSaved>((event, emit) async {
      emit(state.copyWith(isSaving: true, errorMessage: null));

      final param = MerchantShippingUpdateParam(
        internalCourier: state.internalCourier,
        instantCourier: state.instantCourier,
        pickupAtStore: state.pickupAtStore,
        maxDistanceInternalCourier: state.maxDistanceInternalCourier,
        courierCodeAvailable: state.selectedCouriers,
      );

      final result = await _updateShippingUseCase(param: param);

      if (result.data != null) {
        emit(state.copyWith(isSaving: false, isSaved: true));
      } else {
        emit(state.copyWith(isSaving: false, errorMessage: result.message));
      }
    });
  }
}
