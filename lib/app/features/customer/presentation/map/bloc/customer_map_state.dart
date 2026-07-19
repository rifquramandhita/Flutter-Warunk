import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_merchant.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_merchant_category.dart';

class CustomerMapState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final String searchQuery;
  final String activeFilter;
  final List<CustomerMerchantEntity> stores;
  final List<CustomerMerchantEntity> allStores;
  final LatLng? currentLocation;
  final CustomerMerchantEntity? selectedStore;
  final BitmapDescriptor? storeMarker;
  final List<CustomerMerchantCategoryEntity> categories;
  final CustomerMerchantCategoryEntity? activeCategory;
  final double maxDistance;

  const CustomerMapState({
    this.isLoading = false,
    this.errorMessage,
    this.searchQuery = '',
    this.activeFilter = 'Semua',
    this.stores = const [],
    this.allStores = const [],
    this.currentLocation,
    this.selectedStore,
    this.storeMarker,
    this.categories = const [],
    this.activeCategory,
    this.maxDistance = 0.5, // Default to 0.5 km
  });

  CustomerMapState copyWith({
    bool? isLoading,
    String? errorMessage,
    String? searchQuery,
    String? activeFilter,
    List<CustomerMerchantEntity>? stores,
    List<CustomerMerchantEntity>? allStores,
    LatLng? currentLocation,
    CustomerMerchantEntity? selectedStore,
    BitmapDescriptor? storeMarker,
    bool nullifySelectedStore = false,
    List<CustomerMerchantCategoryEntity>? categories,
    CustomerMerchantCategoryEntity? activeCategory,
    bool nullifyActiveCategory = false,
    double? maxDistance,
  }) {
    return CustomerMapState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      searchQuery: searchQuery ?? this.searchQuery,
      activeFilter: activeFilter ?? this.activeFilter,
      stores: stores ?? this.stores,
      allStores: allStores ?? this.allStores,
      currentLocation: currentLocation ?? this.currentLocation,
      selectedStore: nullifySelectedStore
          ? null
          : (selectedStore ?? this.selectedStore),
      storeMarker: storeMarker ?? this.storeMarker,
      categories: categories ?? this.categories,
      activeCategory: nullifyActiveCategory
          ? null
          : (activeCategory ?? this.activeCategory),
      maxDistance: maxDistance ?? this.maxDistance,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    errorMessage,
    searchQuery,
    activeFilter,
    stores,
    allStores,
    currentLocation,
    selectedStore,
    storeMarker,
    categories,
    activeCategory,
    maxDistance,
  ];
}
