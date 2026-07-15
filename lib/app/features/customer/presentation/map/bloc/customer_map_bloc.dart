import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:warunk/theme/app_colors.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_merchant_get_nearby_use_case.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_location_get_current_use_case.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_merchant_get_use_case.dart';
import 'customer_map_event.dart';
import 'customer_map_state.dart';

class CustomerMapBloc extends Bloc<CustomerMapEvent, CustomerMapState> {
  final CustomerMerchantGetNearbyUseCase _getNearbyUseCase;
  final CustomerLocationGetCurrentUseCase _getCurrentLocationUseCase;
  final CustomerMerchantGetUseCase _getMerchantUseCase;

  CustomerMapBloc({
    required CustomerMerchantGetNearbyUseCase getNearbyUseCase,
    required CustomerLocationGetCurrentUseCase getCurrentLocationUseCase,
    required CustomerMerchantGetUseCase getMerchantUseCase,
  }) : _getNearbyUseCase = getNearbyUseCase,
       _getCurrentLocationUseCase = getCurrentLocationUseCase,
       _getMerchantUseCase = getMerchantUseCase,
       super(const CustomerMapState()) {
    on<CustomerLoadMapData>(_onLoadMapData);
    on<CustomerMapFilterChanged>(_onMapFilterChanged);
    on<CustomerMapSearchQueryChanged>(_onMapSearchQueryChanged);
    on<CustomerMapSelectedStoreChanged>(_onMapSelectedStoreChanged);
    on<CustomerMapMarkerInitialized>(_onMapMarkerInitialized);
  }

  Future<void> _onLoadMapData(
    CustomerLoadMapData event,
    Emitter<CustomerMapState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      // 1. Get User Location
      final locationResult = await _getCurrentLocationUseCase();
      LatLng userLocation = const LatLng(
        -6.200000,
        106.816666,
      ); // Jakarta Default

      if (locationResult.data != null) {
        userLocation = LatLng(
          locationResult.data!.latitude,
          locationResult.data!.longitude,
        );
      }

      emit(state.copyWith(currentLocation: userLocation));

      // 2. Fetch Nearby Merchants
      final merchantsResult = await _getNearbyUseCase(
        latitude: userLocation.latitude,
        longitude: userLocation.longitude,
      );

      if (!merchantsResult.success) {
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: merchantsResult.message ?? 'Gagal memuat data',
          ),
        );
        return;
      }

      final stores = merchantsResult.data ?? [];

      emit(state.copyWith(isLoading: false, stores: stores));
    } catch (e) {
      emit(
        state.copyWith(isLoading: false, errorMessage: 'Terjadi kesalahan: $e'),
      );
    }
  }

  void _onMapFilterChanged(
    CustomerMapFilterChanged event,
    Emitter<CustomerMapState> emit,
  ) {
    emit(state.copyWith(activeFilter: event.filter));
  }

  Future<void> _onMapSearchQueryChanged(
    CustomerMapSearchQueryChanged event,
    Emitter<CustomerMapState> emit,
  ) async {
    emit(
      state.copyWith(
        searchQuery: event.query,
        isLoading: true,
        errorMessage: null,
      ),
    );

    try {
      if (event.query.isEmpty) {
        if (state.currentLocation != null) {
          final merchantsResult = await _getNearbyUseCase(
            latitude: state.currentLocation!.latitude,
            longitude: state.currentLocation!.longitude,
          );
          if (merchantsResult.success) {
            emit(
              state.copyWith(
                stores: merchantsResult.data ?? [],
                isLoading: false,
              ),
            );
          } else {
            emit(
              state.copyWith(
                errorMessage: merchantsResult.message ?? 'Gagal memuat data',
                isLoading: false,
              ),
            );
          }
        } else {
          emit(state.copyWith(isLoading: false));
        }
      } else {
        final result = await _getMerchantUseCase(keyword: event.query);
        if (result.success) {
          emit(state.copyWith(stores: result.data ?? [], isLoading: false));
        } else {
          emit(
            state.copyWith(
              errorMessage: result.message ?? 'Gagal memuat pencarian',
              isLoading: false,
            ),
          );
        }
      }
    } catch (e) {
      emit(
        state.copyWith(errorMessage: 'Terjadi kesalahan: $e', isLoading: false),
      );
    }
  }

  void _onMapSelectedStoreChanged(
    CustomerMapSelectedStoreChanged event,
    Emitter<CustomerMapState> emit,
  ) {
    if (event.store == null) {
      emit(state.copyWith(nullifySelectedStore: true));
    } else {
      emit(state.copyWith(selectedStore: event.store));
    }
  }

  void _onMapMarkerInitialized(
    CustomerMapMarkerInitialized event,
    Emitter<CustomerMapState> emit,
  ) {
    emit(state.copyWith(storeMarker: event.marker));
  }
}
