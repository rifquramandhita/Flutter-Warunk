import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_wishlist.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_wishlist_add_use_case.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_product_variant.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_cart_add_param.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_cart_add_use_case.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_product_get_by_id_use_case.dart';
import 'package:warunk/core/network/data_state.dart';
import 'customer_detail_product_event.dart';
import 'customer_detail_product_state.dart';

class CustomerDetailProductBloc
    extends Bloc<CustomerDetailProductEvent, CustomerDetailProductState> {
  final CustomerProductGetByIdUseCase _useCase;
  final CustomerCartAddUseCase _addCartUseCase;
  final CustomerWishlistAddUseCase _addWishlistUseCase;

  CustomerDetailProductBloc({
    required CustomerProductGetByIdUseCase useCase,
    required CustomerCartAddUseCase addCartUseCase,
    required CustomerWishlistAddUseCase addWishlistUseCase,
  }) : _useCase = useCase,
       _addCartUseCase = addCartUseCase,
       _addWishlistUseCase = addWishlistUseCase,
       super(const CustomerDetailProductState()) {
    on<CustomerDetailProductEventStarted>(_onStarted);
    on<CustomerDetailProductEventQuantityChanged>(_onQuantityChanged);
    on<CustomerDetailProductEventVariantChanged>(_onVariantChanged);
    on<CustomerDetailProductEventAddToCart>(_onAddToCart);
    on<CustomerDetailProductEventAddToWishlist>(_onAddToWishlist);
  }

  Future<void> _onStarted(
    CustomerDetailProductEventStarted event,
    Emitter<CustomerDetailProductState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final response = await _useCase.call(event.productId);

    if (response is SuccessState && response.data != null) {
      CustomerProductVariantEntity? selectedVariant;
      Map<String, String>? selectedCombination;

      if (response.data?.variants != null &&
          response.data!.variants!.isNotEmpty) {
        selectedVariant = response.data!.variants!.first;
        selectedCombination = Map<String, String>.from(
          selectedVariant.variantCombination,
        );
      }

      emit(
        state.copyWith(
          product: response.data,
          selectedVariant: selectedVariant,
          selectedVariantCombination: selectedCombination,
        ),
      );
    } else {
      emit(
        state.copyWith(
          errorMessage: response.message ?? 'Gagal memuat detail produk',
        ),
      );
    }

    emit(state.copyWith(isLoading: false));
  }

  void _onQuantityChanged(
    CustomerDetailProductEventQuantityChanged event,
    Emitter<CustomerDetailProductState> emit,
  ) {
    if (event.quantity > 0) {
      final product = state.product;
      int maxStock = 0;

      if (product != null) {
        if (state.selectedVariant != null) {
          maxStock = state.selectedVariant!.stock;
        } else {
          maxStock = product.stock ?? 0;
        }
      }

      if (event.quantity > maxStock) {
        emit(
          state.copyWith(
            errorMessage: 'Jumlah melebihi stok yang tersedia ($maxStock)',
          ),
        );
        return;
      }

      emit(
        state.copyWith(
          quantity: event.quantity,
          errorMessage: state.errorMessage,
        ),
      ); // preserve error if any
    }
  }

  Future<void> _onAddToCart(
    CustomerDetailProductEventAddToCart event,
    Emitter<CustomerDetailProductState> emit,
  ) async {
    final product = state.product;
    if (product == null) return;

    if ((product.hasVariant ?? false) && state.selectedVariant == null) {
      emit(
        state.copyWith(
          errorMessage: 'Silakan pilih varian produk terlebih dahulu',
          isSuccess: false,
        ),
      );
      return;
    }

    emit(state.copyWith(isLoading: true));

    final param = CustomerCartAddParam(
      productId: product.id,
      productVariantId: state.selectedVariant?.id,
      quantity: state.quantity,
      notes: event.notes,
    );

    final response = await _addCartUseCase.call(param);

    if (response is SuccessState) {
      emit(state.copyWith(isLoading: false, isSuccess: true));
    } else {
      emit(state.copyWith(isLoading: false, errorMessage: response.message));
    }
  }

  Future<void> _onAddToWishlist(
    CustomerDetailProductEventAddToWishlist event,
    Emitter<CustomerDetailProductState> emit,
  ) async {
    final product = state.product;
    if (product == null) return;

    emit(state.copyWith(isLoading: true));

    final param = CustomerWishlistAddParam(productId: product.id);
    final response = await _addWishlistUseCase.call(param);

    if (response is SuccessState) {
      emit(state.copyWith(isLoading: false, isWishlistSuccess: true));
      add(
        CustomerDetailProductEventStarted(productId: state.product?.id ?? ''),
      );
    } else {
      emit(state.copyWith(isLoading: false, errorMessage: response.message));
    }
  }

  void _onVariantChanged(
    CustomerDetailProductEventVariantChanged event,
    Emitter<CustomerDetailProductState> emit,
  ) {
    final product = state.product;
    if (product == null || product.variants == null) return;

    CustomerProductVariantEntity? matchedVariant;
    for (final variant in product.variants!) {
      bool isMatch = true;
      for (final key in event.selectedCombination.keys) {
        if (variant.variantCombination[key] != event.selectedCombination[key]) {
          isMatch = false;
          break;
        }
      }
      // Assuming all keys match
      if (isMatch &&
          variant.variantCombination.length ==
              event.selectedCombination.length) {
        matchedVariant = variant;
        break;
      }
    }

    int newQuantity = state.quantity;
    if (matchedVariant != null && state.quantity > matchedVariant.stock) {
      newQuantity = matchedVariant.stock;
      if (newQuantity < 1) {
        newQuantity =
            1; // Keep at least 1, but they won't be able to add to cart due to backend validation or Add to Cart validation
      }
    }

    emit(
      state.copyWith(
        selectedVariantCombination: event.selectedCombination,
        selectedVariant: matchedVariant,
        quantity: newQuantity,
        errorMessage: state.errorMessage,
      ),
    );
  }
}
