part of 'customer_category_bloc.dart';

class CustomerCategoryState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final List<CustomerMerchantCategoryEntity> categories;
  final String searchQuery;
  final int cartCount;

  const CustomerCategoryState({
    this.isLoading = false,
    this.errorMessage,
    this.categories = const [],
    this.searchQuery = '',
    this.cartCount = 0,
  });

  CustomerCategoryState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<CustomerMerchantCategoryEntity>? categories,
    String? searchQuery,
    int? cartCount,
  }) {
    return CustomerCategoryState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      categories: categories ?? this.categories,
      searchQuery: searchQuery ?? this.searchQuery,
      cartCount: cartCount ?? this.cartCount,
    );
  }

  @override
  List<Object?> get props => [isLoading, errorMessage, categories, searchQuery, cartCount];
}
