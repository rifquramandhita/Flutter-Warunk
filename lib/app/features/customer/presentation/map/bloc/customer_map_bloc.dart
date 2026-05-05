import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/core/constants/app_colors.dart';
import 'customer_map_event.dart';
import 'customer_map_state.dart';

class CustomerMapBloc extends Bloc<CustomerMapEvent, CustomerMapState> {
  CustomerMapBloc() : super(const CustomerMapState()) {
    on<CustomerLoadMapData>(_onLoadMapData);
    on<CustomerMapFilterChanged>(_onMapFilterChanged);
    on<CustomerMapSearchQueryChanged>(_onMapSearchQueryChanged);
  }

  void _onLoadMapData(CustomerLoadMapData event, Emitter<CustomerMapState> emit) {
    emit(state.copyWith(isLoading: true));
    
    // Mock map data
    final mockStores = [
      CustomerMapStore(
        id: '1',
        name: 'Warung Madura Cahaya',
        status: 'Buka',
        statusColor: AppColors.primary,
        rating: 4.7,
        reviews: 128,
        distance: '0,6 km',
        location: 'Jakarta Timur',
        promo: 'Promo Ongkir',
        coordinates: const Offset(0.3, 0.4), // x,y percentages for mockup
      ),
      CustomerMapStore(
        id: '2',
        name: 'Toko Sumber Rezeki',
        status: 'Promo',
        statusColor: const Color(0xFFF59E0B),
        rating: 4.5,
        reviews: 95,
        distance: '1,2 km',
        location: 'Jakarta Timur',
        promo: 'Promo Ongkir',
        coordinates: const Offset(0.7, 0.3),
      ),
      CustomerMapStore(
        id: '3',
        name: 'Kelontong Jaya',
        status: 'Buka',
        statusColor: AppColors.primary,
        rating: 4.6,
        reviews: 77,
        distance: '1,5 km',
        location: 'Jakarta Timur',
        promo: '',
        coordinates: const Offset(0.5, 0.6),
      ),
      CustomerMapStore(
        id: '4',
        name: 'Warung Barokah',
        status: 'Promo',
        statusColor: const Color(0xFFF59E0B),
        rating: 4.8,
        reviews: 203,
        distance: '0,9 km',
        location: 'Jakarta Timur',
        promo: 'Diskon 10%',
        coordinates: const Offset(0.2, 0.7),
      ),
      CustomerMapStore(
        id: '5',
        name: 'Kaki Lima Pak Kumis',
        status: 'Buka',
        statusColor: AppColors.primary,
        rating: 4.3,
        reviews: 45,
        distance: '0,3 km',
        location: 'Jakarta Timur',
        promo: '',
        coordinates: const Offset(0.8, 0.75),
      ),
    ];

    emit(state.copyWith(isLoading: false, stores: mockStores));
  }

  void _onMapFilterChanged(CustomerMapFilterChanged event, Emitter<CustomerMapState> emit) {
    emit(state.copyWith(activeFilter: event.filter));
  }

  void _onMapSearchQueryChanged(CustomerMapSearchQueryChanged event, Emitter<CustomerMapState> emit) {
    emit(state.copyWith(searchQuery: event.query));
  }
}
