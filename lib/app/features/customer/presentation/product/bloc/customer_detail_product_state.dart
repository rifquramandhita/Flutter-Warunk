import 'package:equatable/equatable.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_product.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_product_variant.dart';

class CustomerDetailProductState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final CustomerProductEntity? product;
  final int quantity;
  final Map<String, String>? selectedVariantCombination;
  final CustomerProductVariantEntity? selectedVariant;
  final bool isSuccess;
  final bool isWishlistSuccess;

  const CustomerDetailProductState({
    this.isLoading = false,
    this.errorMessage,
    this.product,
    this.quantity = 1,
    this.selectedVariantCombination,
    this.selectedVariant,
    this.isSuccess = false,
    this.isWishlistSuccess = false,
  });

  CustomerDetailProductState copyWith({
    bool? isLoading,
    String? errorMessage,
    CustomerProductEntity? product,
    int? quantity,
    Map<String, String>? selectedVariantCombination,
    CustomerProductVariantEntity? selectedVariant,
    bool? isSuccess,
    bool? isWishlistSuccess,
  }) {
    return CustomerDetailProductState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      selectedVariantCombination:
          selectedVariantCombination ?? this.selectedVariantCombination,
      selectedVariant: selectedVariant ?? this.selectedVariant,
      isSuccess: isSuccess ?? false,
      isWishlistSuccess: isWishlistSuccess ?? false,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    errorMessage,
    product,
    quantity,
    selectedVariantCombination,
    selectedVariant,
    isSuccess,
    isWishlistSuccess,
  ];
}
