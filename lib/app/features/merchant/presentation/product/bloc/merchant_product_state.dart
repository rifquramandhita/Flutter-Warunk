part of 'merchant_product_bloc.dart';

class MerchantProductState extends Equatable {
  final int selectedTab;
  final String searchQuery;
  final List<MerchantProduct> allProducts;
  final bool isLoading;
  final String? errorMessage;

  const MerchantProductState({
    this.selectedTab = 0,
    this.searchQuery = '',
    this.allProducts = const [],
    this.isLoading = false,
    this.errorMessage,
  });

  List<MerchantProductCategory> get categories {
    final Set<String> seenIds = {};
    final List<MerchantProductCategory> uniqueCats = [];

    for (final product in allProducts) {
      final cat = product.productCategory;
      if (!seenIds.contains(cat.id)) {
        seenIds.add(cat.id);
        uniqueCats.add(cat);
      }
    }

    return [
      const MerchantProductCategory.entity(
        id: 'semua',
        name: 'Semua',
        slug: 'semua',
      ),
      ...uniqueCats,
    ];
  }

  List<MerchantProduct> get filteredProducts {
    var list = allProducts;

    // filter by category
    if (selectedTab > 0 && selectedTab < categories.length) {
      final cat = categories[selectedTab];
      list = list.where((p) => p.productCategory.id == cat.id).toList();
    }

    // filter by search query
    if (searchQuery.isNotEmpty) {
      final q = searchQuery.toLowerCase();
      list = list.where((p) => p.name.toLowerCase().contains(q)).toList();
    }

    return list;
  }

  MerchantProductState copyWith({
    int? selectedTab,
    String? searchQuery,
    List<MerchantProduct>? allProducts,
    bool? isLoading,
    String? errorMessage,
  }) => MerchantProductState(
    selectedTab: selectedTab ?? this.selectedTab,
    searchQuery: searchQuery ?? this.searchQuery,
    allProducts: allProducts ?? this.allProducts,
    isLoading: isLoading ?? this.isLoading,
    errorMessage: errorMessage ?? this.errorMessage,
  );

  @override
  List<Object?> get props => [
    selectedTab,
    searchQuery,
    allProducts,
    isLoading,
    errorMessage,
  ];
}
