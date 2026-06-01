import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_merchant_get_by_id_use_case.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_product_get_by_merchant_use_case.dart';
import 'package:warunk/core/network/data_state.dart';
import 'customer_store_event.dart';
import 'customer_store_state.dart';

class CustomerStoreBloc extends Bloc<CustomerStoreEvent, CustomerStoreState> {
  final CustomerMerchantGetByIdUseCase _getByIdUseCase;
  final CustomerProductGetByMerchantUseCase _productGetByMerchantUseCase;

  CustomerStoreBloc({
    required CustomerMerchantGetByIdUseCase getByIdUseCase,
    required CustomerProductGetByMerchantUseCase productGetByMerchantUseCase,
  })  : _getByIdUseCase = getByIdUseCase,
        _productGetByMerchantUseCase = productGetByMerchantUseCase,
        super(const CustomerStoreState()) {
    on<CustomerStoreEventLoadStoreDetails>(_onLoadStoreDetails);
    on<CustomerStoreEventSelectCategory>(_onSelectCategory);
    on<CustomerStoreEventAddToCart>(_onAddToCart);
  }

  Future<void> _onLoadStoreDetails(
    CustomerStoreEventLoadStoreDetails event,
    Emitter<CustomerStoreState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, storeId: event.storeId));

    final merchantResponse = await _getByIdUseCase.call(event.storeId);

    if (merchantResponse is SuccessState) {
      final productResponse = await _productGetByMerchantUseCase.call(event.storeId);
      
      var products = state.products;
      var categories = ['Semua'];
      if (productResponse is SuccessState && productResponse.data != null) {
        products = productResponse.data!;
        categories.addAll(products.map((e) => e.category).toSet());
      }

      emit(
        state.copyWith(
          merchantDetail: merchantResponse.data,
          storeName: merchantResponse.data?.name,
          products: products,
          categories: categories,
          cartCount: 2, // Dummy existing cart items
          cartTotalAmount: 28500, // Rp28.500
        ),
      );
    } else {
      emit(state.copyWith(errorMessage: merchantResponse.message));
    }

    emit(state.copyWith(isLoading: false));
  }

  void _onSelectCategory(
    CustomerStoreEventSelectCategory event,
    Emitter<CustomerStoreState> emit,
  ) {
    emit(state.copyWith(selectedCategory: event.index));
  }

  void _onAddToCart(
    CustomerStoreEventAddToCart event,
    Emitter<CustomerStoreState> emit,
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
