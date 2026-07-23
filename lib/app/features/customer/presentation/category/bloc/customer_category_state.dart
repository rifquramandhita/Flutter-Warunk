part of 'customer_category_bloc.dart';

class CustomerCategoryState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final List<CustomerMerchantCategoryEntity> categories;
  final String searchQuery;

  const CustomerCategoryState({
    this.isLoading = false,
    this.errorMessage,
    this.categories = const [],
    this.searchQuery = '',
  });

  CustomerCategoryState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<CustomerMerchantCategoryEntity>? categories,
    String? searchQuery,
  }) {
    return CustomerCategoryState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      categories: categories ?? this.categories,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }

  @override
  List<Object?> get props => [isLoading, errorMessage, categories, searchQuery];
}
