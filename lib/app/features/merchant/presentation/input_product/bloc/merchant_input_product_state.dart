part of 'merchant_input_product_bloc.dart';

class MerchantInputProductState {
  final String? id;
  final String name;
  final String category;
  final String price;
  final String stock;
  final String minPurchase;
  final String description;
  final bool isPublished;
  final bool isSuccess;
  final bool isLoading;
  final String? errorMessage;
  final List<String> imageUrls;

  final String weight;
  final String length;
  final String width;
  final String height;

  static const List<String> categoryOptions = [
    'Minuman',
    'Makanan',
    'Sembako',
    'Lainnya',
  ];

  const MerchantInputProductState({
    this.id,
    this.name = '',
    this.category = '',
    this.price = '',
    this.stock = '',
    this.minPurchase = '1',
    this.description = '',
    this.isPublished = true,
    this.isSuccess = false,
    this.isLoading = false,
    this.errorMessage,
    this.imageUrls = const [],
    this.weight = '',
    this.length = '',
    this.width = '',
    this.height = '',
  });

  bool get isValid =>
      name.trim().isNotEmpty &&
      category.isNotEmpty &&
      (int.tryParse(price) ?? 0) > 0 &&
      (int.tryParse(stock) ?? 0) >= 0 &&
      (int.tryParse(minPurchase) ?? 0) > 0;

  int get descriptionLength => description.length;

  MerchantInputProductState copyWith({
    String? id,
    String? name,
    String? category,
    String? price,
    String? stock,
    String? minPurchase,
    String? description,
    bool? isPublished,
    bool? isSuccess,
    bool? isLoading,
    String? errorMessage,
    List<String>? imageUrls,
    String? weight,
    String? length,
    String? width,
    String? height,
  }) => MerchantInputProductState(
    id: id ?? this.id,
    name: name ?? this.name,
    category: category ?? this.category,
    price: price ?? this.price,
    stock: stock ?? this.stock,
    minPurchase: minPurchase ?? this.minPurchase,
    description: description ?? this.description,
    isPublished: isPublished ?? this.isPublished,
    isSuccess: isSuccess ?? false,
    isLoading: isLoading ?? this.isLoading,
    errorMessage: errorMessage,
    imageUrls: imageUrls ?? this.imageUrls,
    weight: weight ?? this.weight,
    length: length ?? this.length,
    width: width ?? this.width,
    height: height ?? this.height,
  );
}
