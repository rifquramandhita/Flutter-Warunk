import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geocoding/geocoding.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_location_get_current_use_case.dart';

part 'customer_address_maps_event.dart';
part 'customer_address_maps_state.dart';

class CustomerAddressMapsBloc extends Bloc<CustomerAddressMapsEvent, CustomerAddressMapsState> {
  final CustomerLocationGetCurrentUseCase _getCurrentLocationUseCase;

  CustomerAddressMapsBloc(this._getCurrentLocationUseCase) : super(const CustomerAddressMapsState()) {
    on<CustomerAddressMapsEventInit>(_onInit);
    on<CustomerAddressMapsEventLocationChanged>(_onLocationChanged);
    on<CustomerAddressMapsEventGetMyLocation>(_onGetMyLocation);
    on<CustomerAddressMapsEventSearchLocation>(_onSearchLocation);
    on<CustomerAddressMapsEventMoveCamera>(_onMoveCamera);
  }

  Future<void> _onInit(
    CustomerAddressMapsEventInit event,
    Emitter<CustomerAddressMapsState> emit,
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
    CustomerAddressMapsEventLocationChanged event,
    Emitter<CustomerAddressMapsState> emit,
  ) {
    emit(state.copyWith(
      latitude: event.latitude,
      longitude: event.longitude,
    ));
  }

  Future<void> _onGetMyLocation(
    CustomerAddressMapsEventGetMyLocation event,
    Emitter<CustomerAddressMapsState> emit,
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

  Future<void> _onSearchLocation(
    CustomerAddressMapsEventSearchLocation event,
    Emitter<CustomerAddressMapsState> emit,
  ) async {
    if (event.query.trim().isEmpty) return;

    emit(state.copyWith(isSearchingLocation: true));

    try {
      List<Location> locations = await locationFromAddress(event.query);
      if (locations.isNotEmpty) {
        final location = locations.first;
        emit(state.copyWith(
          latitude: location.latitude,
          longitude: location.longitude,
          moveCameraToCurrentLocation: true,
          isSearchingLocation: false,
        ));
      } else {
        emit(state.copyWith(
          errorMessage: 'Lokasi tidak ditemukan',
          isSearchingLocation: false,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        errorMessage: 'Gagal mencari lokasi',
        isSearchingLocation: false,
      ));
    }
  }

  void _onMoveCamera(
    CustomerAddressMapsEventMoveCamera event,
    Emitter<CustomerAddressMapsState> emit,
  ) {
    emit(state.copyWith(
      latitude: event.latitude,
      longitude: event.longitude,
      moveCameraToCurrentLocation: true,
    ));
  }
}
