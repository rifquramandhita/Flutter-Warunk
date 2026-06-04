part of 'merchant_input_product_bloc.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Variant definition model (name + list of option name strings)
// ─────────────────────────────────────────────────────────────────────────────
class VariantInput {
  final String name;
  final List<String> options; // e.g. ['Merah', 'Putih']

  const VariantInput({this.name = '', this.options = const []});

  VariantInput copyWith({String? name, List<String>? options}) =>
      VariantInput(name: name ?? this.name, options: options ?? this.options);
}

// ─────────────────────────────────────────────────────────────────────────────
// State
// ─────────────────────────────────────────────────────────────────────────────
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

  /// Variant definitions (max 2).
  final List<VariantInput> variants;

  /// Auto-generated Cartesian product of all variant options.
  /// Each item is a [MerchantProductVariantSendParam] ready to send.
  final List<MerchantProductVariantSendParam> combinations;

  final bool isSameDimension;

  /// Categories loaded from API for the dropdown.
  final List<MerchantProductCategoryEntity> categories;
  final bool isCategoriesLoading;

  static const int maxVariants = 2;

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
    this.variants = const [],
    this.combinations = const [],
    this.isSameDimension = true,
    this.categories = const [],
    this.isCategoriesLoading = false,
  });

  bool get hasVariants => variants.isNotEmpty;
  bool get canAddVariant => variants.length < maxVariants;

  bool get isValid {
    final baseValid = name.trim().isNotEmpty && category.isNotEmpty;

    if (!hasVariants) {
      return baseValid &&
          (int.tryParse(price) ?? 0) > 0 &&
          (int.tryParse(stock) ?? 0) >= 0 &&
          (int.tryParse(minPurchase) ?? 0) > 0;
    }

    // With variants: every variant must have a name and ≥1 non-empty option
    final variantsValid = variants.every(
      (v) =>
          v.name.trim().isNotEmpty && v.options.any((o) => o.trim().isNotEmpty),
    );
    return baseValid && variantsValid && combinations.isNotEmpty;
  }

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
    List<VariantInput>? variants,
    List<MerchantProductVariantSendParam>? combinations,
    bool? isSameDimension,
    List<MerchantProductCategoryEntity>? categories,
    bool? isCategoriesLoading,
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
    variants: variants ?? this.variants,
    combinations: combinations ?? this.combinations,
    isSameDimension: isSameDimension ?? this.isSameDimension,
    categories: categories ?? this.categories,
    isCategoriesLoading: isCategoriesLoading ?? this.isCategoriesLoading,
  );
}
