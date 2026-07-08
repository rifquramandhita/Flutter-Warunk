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
  final bool showAllMerchants;

  const CustomerSearchState({
    this.isLoading = false,
    this.errorMessage,
    this.showResults = false,
    this.searchQuery = '',
    this.activeFilters = const ['Jakarta', 'Terdekat', 'Buka', 'Promo'],
    this.merchants = const [],
    this.products = const [],
    this.showAllMerchants = false,
  });



  CustomerSearchState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? showResults,
    String? searchQuery,
    List<String>? activeFilters,
    List<CustomerMerchantEntity>? merchants,
    List<CustomerProductEntity>? products,
    bool? showAllMerchants,
  }) {
    return CustomerSearchState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      showResults: showResults ?? this.showResults,
      searchQuery: searchQuery ?? this.searchQuery,
      activeFilters: activeFilters ?? this.activeFilters,
      merchants: merchants ?? this.merchants,
      products: products ?? this.products,
      showAllMerchants: showAllMerchants ?? this.showAllMerchants,
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
    showAllMerchants,
  ];
}
