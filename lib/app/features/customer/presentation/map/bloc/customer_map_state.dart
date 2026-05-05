import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CustomerMapStore extends Equatable {
  final String id;
  final String name;
  final String status;
  final Color statusColor;
  final double rating;
  final int reviews;
  final String distance;
  final String location;
  final String promo;
  final Offset coordinates; // Mock coordinates for UI placement

  const CustomerMapStore({
    required this.id,
    required this.name,
    required this.status,
    required this.statusColor,
    required this.rating,
    required this.reviews,
    required this.distance,
    required this.location,
    required this.promo,
    required this.coordinates,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    status,
    statusColor,
    rating,
    reviews,
    distance,
    location,
    promo,
    coordinates,
  ];
}

class CustomerMapState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final String searchQuery;
  final String activeFilter;
  final List<CustomerMapStore> stores;

  const CustomerMapState({
    this.isLoading = false,
    this.errorMessage,
    this.searchQuery = '',
    this.activeFilter = 'Semua',
    this.stores = const [],
  });

  CustomerMapState copyWith({
    bool? isLoading,
    String? errorMessage,
    String? searchQuery,
    String? activeFilter,
    List<CustomerMapStore>? stores,
  }) {
    return CustomerMapState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      searchQuery: searchQuery ?? this.searchQuery,
      activeFilter: activeFilter ?? this.activeFilter,
      stores: stores ?? this.stores,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    errorMessage,
    searchQuery,
    activeFilter,
    stores,
  ];
}
