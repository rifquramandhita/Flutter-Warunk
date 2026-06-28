part of 'customer_home_bloc.dart';

final class CustomerHomeState extends Equatable {
  final bool isLoading;
  final bool isLoadingCategories;
  final String? errorMessage;
  final int currentBanner;
  final List<CustomerMerchantCategoryEntity> categories;

  const CustomerHomeState({
    this.isLoading = false,
    this.isLoadingCategories = false,
    this.errorMessage,
    this.currentBanner = 0,
    this.categories = const [],
  });

  CustomerHomeState copyWith({
    bool? isLoading,
    bool? isLoadingCategories,
    String? errorMessage,
    int? currentBanner,
    List<CustomerMerchantCategoryEntity>? categories,
  }) {
    return CustomerHomeState(
      isLoading: isLoading ?? this.isLoading,
      isLoadingCategories: isLoadingCategories ?? this.isLoadingCategories,
      errorMessage: errorMessage,
      currentBanner: currentBanner ?? this.currentBanner,
      categories: categories ?? this.categories,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    isLoadingCategories,
    errorMessage,
    currentBanner,
    categories,
  ];
}
