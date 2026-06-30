import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_merchant_get_by_id_use_case.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_product_get_use_case.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_cart_get_use_case.dart';
import 'package:warunk/core/network/data_state.dart';
import 'customer_detail_merchant_event.dart';
import 'customer_detail_merchant_state.dart';

class CustomerDetailMerchantBloc
    extends Bloc<CustomerDetailMerchantEvent, CustomerDetailMerchantState> {
  final CustomerMerchantGetByIdUseCase _getByIdUseCase;
  final CustomerProductGetUseCase _productGetUseCase;
  final CustomerCartGetUseCase _cartGetUseCase;

  CustomerDetailMerchantBloc({
    required CustomerMerchantGetByIdUseCase getByIdUseCase,
    required CustomerProductGetUseCase productGetUseCase,
    required CustomerCartGetUseCase cartGetUseCase,
  }) : _getByIdUseCase = getByIdUseCase,
       _productGetUseCase = productGetUseCase,
       _cartGetUseCase = cartGetUseCase,
       super(const CustomerDetailMerchantState()) {
    on<CustomerDetailMerchantEventGet>(_onLoadStoreDetails);
    on<CustomerDetailMerchantEventSelectCategory>(_onSelectCategory);
    on<CustomerDetailMerchantEventAddToCart>(_onAddToCart);
  }

  Future<void> _onLoadStoreDetails(
    CustomerDetailMerchantEventGet event,
    Emitter<CustomerDetailMerchantState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, storeId: event.storeId));

    final merchantResponse = await _getByIdUseCase.call(event.storeId);

    if (merchantResponse is SuccessState) {
      final productResponse = await _productGetUseCase.call(
        merchantId: event.storeId,
      );
      final cartResponse = await _cartGetUseCase.call();

      var products = state.products;
      var categories = ['Semua'];
      if (productResponse is SuccessState && productResponse.data != null) {
        products = productResponse.data!;
        categories.addAll(products.map((e) => e.category).toSet());
      }

      int cartCount = 0;
      int cartTotalAmount = 0;
      if (cartResponse is SuccessState && cartResponse.data != null) {
        final storeCarts = cartResponse.data!
            .where((cart) => cart.product?.merchantId == event.storeId)
            .toList();
        cartCount = storeCarts.fold(0, (sum, item) => sum + item.quantity);
        cartTotalAmount = storeCarts.fold(
          0,
          (sum, item) => sum + item.subtotal,
        );
      }

      emit(
        state.copyWith(
          merchantDetail: merchantResponse.data,
          storeName: merchantResponse.data?.name,
          products: products,
          categories: categories,
          cartCount: cartCount,
          cartTotalAmount: cartTotalAmount,
        ),
      );
    } else {
      emit(state.copyWith(errorMessage: merchantResponse.message));
    }

    emit(state.copyWith(isLoading: false));
  }

  void _onSelectCategory(
    CustomerDetailMerchantEventSelectCategory event,
    Emitter<CustomerDetailMerchantState> emit,
  ) {
    emit(state.copyWith(selectedCategory: event.index));
  }

  void _onAddToCart(
    CustomerDetailMerchantEventAddToCart event,
    Emitter<CustomerDetailMerchantState> emit,
  ) {
    final price = event.product.price;

    emit(
      state.copyWith(
        cartCount: state.cartCount + 1,
        cartTotalAmount: state.cartTotalAmount + price,
      ),
    );
  }
}
