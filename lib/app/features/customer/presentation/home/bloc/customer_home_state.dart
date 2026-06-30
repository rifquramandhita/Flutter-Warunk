part of 'customer_home_bloc.dart';

final class CustomerHomeState extends Equatable {
  final bool isLoading;
  final bool isLoadingCategories;
  final bool isLoadingNearby;
  final String? errorMessage;
  final int currentBanner;
  final List<CustomerMerchantCategoryEntity> categories;
  final List<CustomerMerchantEntity> nearbyMerchants;
  final List<CustomerPromotionInformationEntity> banners;
  final bool isLoadingBanners;
  final String userName;

  const CustomerHomeState({
    this.isLoading = false,
    this.isLoadingCategories = false,
    this.isLoadingNearby = false,
    this.errorMessage,
    this.currentBanner = 0,
    this.categories = const [],
    this.nearbyMerchants = const [],
    this.banners = const [],
    this.isLoadingBanners = false,
    this.userName = '',
  });

  CustomerHomeState copyWith({
    bool? isLoading,
    bool? isLoadingCategories,
    bool? isLoadingNearby,
    String? errorMessage,
    int? currentBanner,
    List<CustomerMerchantCategoryEntity>? categories,
    List<CustomerMerchantEntity>? nearbyMerchants,
    List<CustomerPromotionInformationEntity>? banners,
    bool? isLoadingBanners,
    String? userName,
  }) {
    return CustomerHomeState(
      isLoading: isLoading ?? this.isLoading,
      isLoadingCategories: isLoadingCategories ?? this.isLoadingCategories,
      isLoadingNearby: isLoadingNearby ?? this.isLoadingNearby,
      errorMessage: errorMessage,
      currentBanner: currentBanner ?? this.currentBanner,
      categories: categories ?? this.categories,
      nearbyMerchants: nearbyMerchants ?? this.nearbyMerchants,
      banners: banners ?? this.banners,
      isLoadingBanners: isLoadingBanners ?? this.isLoadingBanners,
      userName: userName ?? this.userName,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    isLoadingCategories,
    isLoadingNearby,
    errorMessage,
    currentBanner,
    categories,
    nearbyMerchants,
    banners,
    isLoadingBanners,
    userName,
  ];
}
