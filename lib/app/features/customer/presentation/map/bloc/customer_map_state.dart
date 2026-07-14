import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_merchant.dart';

class CustomerMapState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final String searchQuery;
  final String activeFilter;
  final List<CustomerMerchantEntity> stores;
  final LatLng? currentLocation;
  final CustomerMerchantEntity? selectedStore;
  final BitmapDescriptor? storeMarker;

  const CustomerMapState({
    this.isLoading = false,
    this.errorMessage,
    this.searchQuery = '',
    this.activeFilter = 'Semua',
    this.stores = const [],
    this.currentLocation,
    this.selectedStore,
    this.storeMarker,
  });

  CustomerMapState copyWith({
    bool? isLoading,
    String? errorMessage,
    String? searchQuery,
    String? activeFilter,
    List<CustomerMerchantEntity>? stores,
    LatLng? currentLocation,
    CustomerMerchantEntity? selectedStore,
    BitmapDescriptor? storeMarker,
    bool nullifySelectedStore = false,
  }) {
    return CustomerMapState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      searchQuery: searchQuery ?? this.searchQuery,
      activeFilter: activeFilter ?? this.activeFilter,
      stores: stores ?? this.stores,
      currentLocation: currentLocation ?? this.currentLocation,
      selectedStore: nullifySelectedStore ? null : (selectedStore ?? this.selectedStore),
      storeMarker: storeMarker ?? this.storeMarker,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    errorMessage,
    searchQuery,
    activeFilter,
    stores,
    currentLocation,
    selectedStore,
    storeMarker,
  ];
}
