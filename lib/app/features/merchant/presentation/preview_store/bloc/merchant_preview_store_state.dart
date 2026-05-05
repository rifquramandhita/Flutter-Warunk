part of 'merchant_preview_store_bloc.dart';

class PreviewProductItem {
  final String id;
  final String name;
  final int price;
  final String emoji;

  const PreviewProductItem({
    required this.id,
    required this.name,
    required this.price,
    required this.emoji,
  });
}

class MerchantPreviewStoreState {
  final String storeName;
  final double rating;
  final int reviewCount;
  final String location;
  final bool isOpen;
  final int selectedTabIndex;
  final List<String> tabs;
  final List<PreviewProductItem> products;

  const MerchantPreviewStoreState({
    this.storeName = 'Warunk Bu Siti',
    this.rating = 4.8,
    this.reviewCount = 128,
    this.location = 'Jakarta Timur',
    this.isOpen = true,
    this.selectedTabIndex = 0,
    this.tabs = const ['Semua', 'Makanan', 'Minuman', 'Sembako'],
    this.products = const [
      PreviewProductItem(id: '1', name: 'Nasi Pecel Warunk', price: 18000, emoji: '🥗'),
      PreviewProductItem(id: '2', name: 'Es Teh Manis', price: 6000, emoji: '🧋'),
      PreviewProductItem(id: '3', name: 'Kerupuk Udang', price: 5000, emoji: '🍘'),
      PreviewProductItem(id: '4', name: 'Tempe Mendoan', price: 7000, emoji: '🥟'),
    ],
  });

  MerchantPreviewStoreState copyWith({
    String? storeName,
    double? rating,
    int? reviewCount,
    String? location,
    bool? isOpen,
    int? selectedTabIndex,
    List<String>? tabs,
    List<PreviewProductItem>? products,
  }) {
    return MerchantPreviewStoreState(
      storeName: storeName ?? this.storeName,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      location: location ?? this.location,
      isOpen: isOpen ?? this.isOpen,
      selectedTabIndex: selectedTabIndex ?? this.selectedTabIndex,
      tabs: tabs ?? this.tabs,
      products: products ?? this.products,
    );
  }
}
