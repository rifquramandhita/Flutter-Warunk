import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_merchant_category.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_merchant_get_category_use_case.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_cart_get_use_case.dart';
import 'package:warunk/core/network/data_state.dart';

part 'customer_category_event.dart';
part 'customer_category_state.dart';

class CustomerCategoryBloc extends Bloc<CustomerCategoryEvent, CustomerCategoryState> {
  final CustomerMerchantGetCategoryUseCase _getCategoryUseCase;
  final CustomerCartGetUseCase _getCartUseCase;

  CustomerCategoryBloc({
    required CustomerMerchantGetCategoryUseCase getCategoryUseCase,
    required CustomerCartGetUseCase getCartUseCase,
  })  : _getCategoryUseCase = getCategoryUseCase,
        _getCartUseCase = getCartUseCase,
        super(const CustomerCategoryState()) {
    on<CustomerCategoryStarted>(_onStarted);
    on<CustomerCategorySearchChanged>(_onSearchChanged);
  }

  Future<void> _onStarted(CustomerCategoryStarted event, Emitter<CustomerCategoryState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    
    final results = await Future.wait([
      _getCategoryUseCase(),
      _getCartUseCase(),
    ]);

    final categoryResult = results[0];
    final cartResult = results[1];

    int cartCount = 0;
    if (cartResult is SuccessState && cartResult.data != null) {
      cartCount = (cartResult.data as List).length;
    }

    if (categoryResult is SuccessState) {
      final categories = (categoryResult.data as List<CustomerMerchantCategoryEntity>?)?.toList() ?? [];
      categories.insert(
        0,
        const CustomerMerchantCategoryEntity(
          id: 'all',
          name: 'Semua Warung',
          slug: 'all',
        ),
      );
      emit(state.copyWith(isLoading: false, categories: categories, cartCount: cartCount));
    } else {
      emit(state.copyWith(isLoading: false, errorMessage: categoryResult.message, cartCount: cartCount));
    }
  }

  void _onSearchChanged(
    CustomerCategorySearchChanged event,
    Emitter<CustomerCategoryState> emit,
  ) {
    emit(state.copyWith(searchQuery: event.query));
  }
}
