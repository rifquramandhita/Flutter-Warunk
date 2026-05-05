import 'package:equatable/equatable.dart';

class CustomerSearchState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final bool showResults;
  final String searchQuery;
  final List<String> activeFilters;

  const CustomerSearchState({
    this.isLoading = false,
    this.errorMessage,
    this.showResults = false,
    this.searchQuery = '',
    this.activeFilters = const ['Jakarta', 'Terdekat', 'Buka', 'Promo'],
  });

  CustomerSearchState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? showResults,
    String? searchQuery,
    List<String>? activeFilters,
  }) {
    return CustomerSearchState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      showResults: showResults ?? this.showResults,
      searchQuery: searchQuery ?? this.searchQuery,
      activeFilters: activeFilters ?? this.activeFilters,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    errorMessage,
    showResults,
    searchQuery,
    activeFilters,
  ];
}
