import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_location_get_current_use_case.dart';

part 'merchant_maps_event.dart';
part 'merchant_maps_state.dart';

class MerchantMapsBloc extends Bloc<MerchantMapsEvent, MerchantMapsState> {
  final MerchantLocationGetCurrentUseCase _getCurrentLocationUseCase;

  MerchantMapsBloc(this._getCurrentLocationUseCase) : super(const MerchantMapsState()) {
    on<MerchantMapsEventInit>(_onInit);
    on<MerchantMapsEventLocationChanged>(_onLocationChanged);
    on<MerchantMapsEventGetMyLocation>(_onGetMyLocation);
  }

  Future<void> _onInit(
    MerchantMapsEventInit event,
    Emitter<MerchantMapsState> emit,
  ) async {
    emit(state.copyWith(isLoadingLocation: true));

    final result = await _getCurrentLocationUseCase.call();
    
    if (result.success && result.data != null) {
      emit(state.copyWith(
        latitude: result.data!.latitude,
        longitude: result.data!.longitude,
        isLoadingLocation: false,
      ));
    } else {
      // Fallback to initial if GPS fails
      if (event.initialLatitude != null &&
          event.initialLongitude != null &&
          event.initialLatitude != 0.0 &&
          event.initialLongitude != 0.0) {
        emit(state.copyWith(
          latitude: event.initialLatitude,
          longitude: event.initialLongitude,
          isLoadingLocation: false,
        ));
      } else {
        emit(state.copyWith(
          errorMessage: result.message,
          isLoadingLocation: false,
        ));
      }
    }
  }

  void _onLocationChanged(
    MerchantMapsEventLocationChanged event,
    Emitter<MerchantMapsState> emit,
  ) {
    emit(state.copyWith(
      latitude: event.latitude,
      longitude: event.longitude,
    ));
  }

  Future<void> _onGetMyLocation(
    MerchantMapsEventGetMyLocation event,
    Emitter<MerchantMapsState> emit,
  ) async {
    final result = await _getCurrentLocationUseCase.call();
    
    if (result.success && result.data != null) {
      emit(state.copyWith(
        latitude: result.data!.latitude,
        longitude: result.data!.longitude,
        moveCameraToCurrentLocation: true,
      ));
    } else {
      emit(state.copyWith(
        errorMessage: result.message,
      ));
    }
  }
}
