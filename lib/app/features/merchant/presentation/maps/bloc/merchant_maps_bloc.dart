import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geocoding/geocoding.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_location_get_current_use_case.dart';

part 'merchant_maps_event.dart';
part 'merchant_maps_state.dart';

class MerchantMapsBloc extends Bloc<MerchantMapsEvent, MerchantMapsState> {
  final MerchantLocationGetCurrentUseCase _getCurrentLocationUseCase;

  MerchantMapsBloc(this._getCurrentLocationUseCase)
    : super(const MerchantMapsState()) {
    on<MerchantMapsEventInit>(_onInit);
    on<MerchantMapsEventLocationChanged>(_onLocationChanged);
    on<MerchantMapsEventGetMyLocation>(_onGetMyLocation);
    on<MerchantMapsEventSearchLocation>(_onSearchLocation);
    on<MerchantMapsEventMoveCamera>(_onMoveCamera);
  }

  Future<void> _onInit(
    MerchantMapsEventInit event,
    Emitter<MerchantMapsState> emit,
  ) async {
    // Fallback to initial if already provided (e.g. existing store location)
    if (event.initialLatitude != null &&
        event.initialLongitude != null &&
        event.initialLatitude != 0.0 &&
        event.initialLongitude != 0.0) {
      emit(
        state.copyWith(
          latitude: event.initialLatitude,
          longitude: event.initialLongitude,
          moveCameraToCurrentLocation: true,
          isLoadingLocation: false,
        ),
      );
      return;
    }

    emit(state.copyWith(isLoadingLocation: true));

    final result = await _getCurrentLocationUseCase.call();

    if (result.success && result.data != null) {
      emit(
        state.copyWith(
          latitude: result.data!.latitude,
          longitude: result.data!.longitude,
          moveCameraToCurrentLocation: true,
          isLoadingLocation: false,
        ),
      );
    } else {
      // Fallback to default position so map is ready to use even if GPS failed
      emit(
        state.copyWith(
          latitude: -6.1753924,
          longitude: 106.8271528,
          errorMessage: result.message,
          isLoadingLocation: false,
        ),
      );
    }
  }

  void _onLocationChanged(
    MerchantMapsEventLocationChanged event,
    Emitter<MerchantMapsState> emit,
  ) {
    emit(state.copyWith(latitude: event.latitude, longitude: event.longitude));
  }

  Future<void> _onGetMyLocation(
    MerchantMapsEventGetMyLocation event,
    Emitter<MerchantMapsState> emit,
  ) async {
    emit(state.copyWith(isLoadingLocation: true));
    final result = await _getCurrentLocationUseCase.call();

    if (result.success && result.data != null) {
      emit(
        state.copyWith(
          latitude: result.data!.latitude,
          longitude: result.data!.longitude,
          moveCameraToCurrentLocation: true,
          isLoadingLocation: false,
        ),
      );
    } else {
      emit(
        state.copyWith(errorMessage: result.message, isLoadingLocation: false),
      );
    }
  }

  Future<void> _onSearchLocation(
    MerchantMapsEventSearchLocation event,
    Emitter<MerchantMapsState> emit,
  ) async {
    if (event.query.trim().isEmpty) return;

    emit(state.copyWith(isSearchingLocation: true));

    try {
      List<Location> locations = await locationFromAddress(event.query);
      if (locations.isNotEmpty) {
        final location = locations.first;
        emit(
          state.copyWith(
            latitude: location.latitude,
            longitude: location.longitude,
            moveCameraToCurrentLocation: true,
            isSearchingLocation: false,
          ),
        );
      } else {
        emit(
          state.copyWith(
            errorMessage: 'Lokasi tidak ditemukan',
            isSearchingLocation: false,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: 'Gagal mencari lokasi',
          isSearchingLocation: false,
        ),
      );
    }
  }

  void _onMoveCamera(
    MerchantMapsEventMoveCamera event,
    Emitter<MerchantMapsState> emit,
  ) {
    emit(
      state.copyWith(
        latitude: event.latitude,
        longitude: event.longitude,
        moveCameraToCurrentLocation: true,
      ),
    );
  }
}
