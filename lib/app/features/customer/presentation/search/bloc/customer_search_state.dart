import 'package:equatable/equatable.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_merchant.dart';

class CustomerSearchState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final bool showResults;
  final String searchQuery;
  final List<String> activeFilters;
  final List<CustomerMerchantEntity> merchants;

  const CustomerSearchState({
    this.isLoading = false,
    this.errorMessage,
    this.showResults = false,
    this.searchQuery = '',
    this.activeFilters = const ['Jakarta', 'Terdekat', 'Buka', 'Promo'],
    this.merchants = const [],
  });

  List<CustomerMerchantEntity> get filteredMerchants {
    if (searchQuery.isEmpty) return merchants;
    final lowerQuery = searchQuery.toLowerCase();
    return merchants.where((merchant) {
      return merchant.name.toLowerCase().contains(lowerQuery);
    }).toList();
  }

  CustomerSearchState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? showResults,
    String? searchQuery,
    List<String>? activeFilters,
    List<CustomerMerchantEntity>? merchants,
  }) {
    return CustomerSearchState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      showResults: showResults ?? this.showResults,
      searchQuery: searchQuery ?? this.searchQuery,
      activeFilters: activeFilters ?? this.activeFilters,
      merchants: merchants ?? this.merchants,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    errorMessage,
    showResults,
    searchQuery,
    activeFilters,
    merchants,
  ];
}
