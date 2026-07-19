import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:warunk/theme/app_colors.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_merchant_get_nearby_use_case.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_location_get_current_use_case.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_merchant_get_use_case.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_merchant_get_category_use_case.dart';
import 'customer_map_event.dart';
import 'customer_map_state.dart';

class CustomerMapBloc extends Bloc<CustomerMapEvent, CustomerMapState> {
  final CustomerMerchantGetNearbyUseCase _getNearbyUseCase;
  final CustomerLocationGetCurrentUseCase _getCurrentLocationUseCase;
  final CustomerMerchantGetUseCase _getMerchantUseCase;
  final CustomerMerchantGetCategoryUseCase _getCategoryUseCase;

  CustomerMapBloc({
    required CustomerMerchantGetNearbyUseCase getNearbyUseCase,
    required CustomerLocationGetCurrentUseCase getCurrentLocationUseCase,
    required CustomerMerchantGetUseCase getMerchantUseCase,
    required CustomerMerchantGetCategoryUseCase getCategoryUseCase,
  }) : _getNearbyUseCase = getNearbyUseCase,
       _getCurrentLocationUseCase = getCurrentLocationUseCase,
       _getMerchantUseCase = getMerchantUseCase,
       _getCategoryUseCase = getCategoryUseCase,
       super(const CustomerMapState()) {
    on<CustomerLoadMapData>(_onLoadMapData);
    on<CustomerMapFilterChanged>(_onMapFilterChanged);
    on<CustomerMapSearchQueryChanged>(_onMapSearchQueryChanged);
    on<CustomerMapSelectedStoreChanged>(_onMapSelectedStoreChanged);
    on<CustomerMapMarkerInitialized>(_onMapMarkerInitialized);
    on<CustomerMapCategorySelected>(_onMapCategorySelected);
    on<CustomerMapDistanceSelected>(_onMapDistanceSelected);
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
      
      final categoryResult = await _getCategoryUseCase();

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
      final categories = categoryResult.data ?? [];

      final filteredStores = stores.where((s) => (s.distance ?? 0.0) <= state.maxDistance).toList();

      emit(state.copyWith(isLoading: false, stores: filteredStores, allStores: stores, categories: categories, nullifyActiveCategory: true));
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
            final stores = merchantsResult.data ?? [];
            final filteredStores = stores.where((s) => (s.distance ?? 0.0) <= state.maxDistance).toList();
            emit(
              state.copyWith(
                stores: filteredStores,
                allStores: stores,
                isLoading: false,
                nullifyActiveCategory: true,
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
          final stores = result.data ?? [];
          final filteredStores = stores.where((s) => (s.distance ?? 0.0) <= state.maxDistance).toList();
          emit(state.copyWith(
            stores: filteredStores, 
            allStores: stores,
            isLoading: false,
            nullifyActiveCategory: true,
          ));
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

  void _onMapCategorySelected(
    CustomerMapCategorySelected event,
    Emitter<CustomerMapState> emit,
  ) {
    final filteredStores = state.allStores.where((s) {
      final matchCategory = event.category == null || s.merchantCategory == event.category!.name;
      final matchDistance = (s.distance ?? 0.0) <= state.maxDistance;
      return matchCategory && matchDistance;
    }).toList();
        
    emit(state.copyWith(
      activeCategory: event.category, 
      nullifyActiveCategory: event.category == null,
      stores: filteredStores,
    ));
  }

  void _onMapDistanceSelected(
    CustomerMapDistanceSelected event,
    Emitter<CustomerMapState> emit,
  ) {
    final filteredStores = state.allStores.where((s) {
      final matchCategory = state.activeCategory == null || s.merchantCategory == state.activeCategory!.name;
      final matchDistance = (s.distance ?? 0.0) <= event.distance;
      return matchCategory && matchDistance;
    }).toList();

    emit(state.copyWith(
      maxDistance: event.distance,
      stores: filteredStores,
    ));
  }
}
