import 'package:equatable/equatable.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_merchant.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_product.dart';

class CustomerSearchState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final bool showResults;
  final String searchQuery;
  final List<String> activeFilters;
  final List<CustomerMerchantEntity> merchants;
  final List<CustomerProductEntity> products;

  const CustomerSearchState({
    this.isLoading = false,
    this.errorMessage,
    this.showResults = false,
    this.searchQuery = '',
    this.activeFilters = const ['Jakarta', 'Terdekat', 'Buka', 'Promo'],
    this.merchants = const [],
    this.products = const [],
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
    List<CustomerProductEntity>? products,
  }) {
    return CustomerSearchState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      showResults: showResults ?? this.showResults,
      searchQuery: searchQuery ?? this.searchQuery,
      activeFilters: activeFilters ?? this.activeFilters,
      merchants: merchants ?? this.merchants,
      products: products ?? this.products,
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
    products,
  ];
}
