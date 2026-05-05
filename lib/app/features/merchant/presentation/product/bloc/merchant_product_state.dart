part of 'merchant_product_bloc.dart';

enum MerchantProductCategory { semua, minuman, makanan, sembako }

class MerchantProduct {
  final String id;
  final String name;
  final MerchantProductCategory category;
  final int price;
  final int stock;
  final bool isActive;
  final String emoji; // placeholder image as emoji

  const MerchantProduct({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.stock,
    required this.isActive,
    required this.emoji,
  });

  MerchantProduct copyWith({bool? isActive}) => MerchantProduct(
        id: id,
        name: name,
        category: category,
        price: price,
        stock: stock,
        isActive: isActive ?? this.isActive,
        emoji: emoji,
      );
}

class MerchantProductState {
  final int selectedTab;
  final String searchQuery;
  final List<MerchantProduct> allProducts;

  static const List<String> tabLabels = [
    'Semua',
    'Minuman',
    'Makanan',
    'Sembako',
  ];

  const MerchantProductState({
    this.selectedTab = 0,
    this.searchQuery = '',
    this.allProducts = const [
      MerchantProduct(
        id: '1',
        name: 'Teh Botol Sosro',
        category: MerchantProductCategory.minuman,
        price: 4000,
        stock: 24,
        isActive: true,
        emoji: '🍶',
      ),
      MerchantProduct(
        id: '2',
        name: 'Indomie Goreng',
        category: MerchantProductCategory.makanan,
        price: 3500,
        stock: 30,
        isActive: true,
        emoji: '🍜',
      ),
      MerchantProduct(
        id: '3',
        name: 'Telur Ayam',
        category: MerchantProductCategory.sembako,
        price: 2000,
        stock: 18,
        isActive: true,
        emoji: '🥚',
      ),
      MerchantProduct(
        id: '4',
        name: 'Kopi ABC Sachet',
        category: MerchantProductCategory.minuman,
        price: 1500,
        stock: 50,
        isActive: true,
        emoji: '☕',
      ),
      MerchantProduct(
        id: '5',
        name: 'Minyak Goreng Bimoli 1L',
        category: MerchantProductCategory.sembako,
        price: 17000,
        stock: 12,
        isActive: true,
        emoji: '🫙',
      ),
      MerchantProduct(
        id: '6',
        name: 'Aqua Botol 600ml',
        category: MerchantProductCategory.minuman,
        price: 3000,
        stock: 60,
        isActive: false,
        emoji: '💧',
      ),
      MerchantProduct(
        id: '7',
        name: 'Beras Ramos 5kg',
        category: MerchantProductCategory.sembako,
        price: 65000,
        stock: 8,
        isActive: true,
        emoji: '🍚',
      ),
      MerchantProduct(
        id: '8',
        name: 'Gorengan Tempe',
        category: MerchantProductCategory.makanan,
        price: 1000,
        stock: 40,
        isActive: true,
        emoji: '🟫',
      ),
    ],
  });

  List<MerchantProduct> get filteredProducts {
    var list = allProducts;

    // filter by category
    if (selectedTab != 0) {
      final cat = MerchantProductCategory.values[selectedTab];
      list = list.where((p) => p.category == cat).toList();
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
  }) =>
      MerchantProductState(
        selectedTab: selectedTab ?? this.selectedTab,
        searchQuery: searchQuery ?? this.searchQuery,
        allProducts: allProducts ?? this.allProducts,
      );
}
