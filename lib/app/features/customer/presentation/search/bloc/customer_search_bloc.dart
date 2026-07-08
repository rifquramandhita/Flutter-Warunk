import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_merchant_get_use_case.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_product_get_use_case.dart';
import 'customer_search_event.dart';
import 'customer_search_state.dart';

class CustomerSearchBloc
    extends Bloc<CustomerSearchEvent, CustomerSearchState> {
  final CustomerMerchantGetUseCase _merchantGetUseCase;
  final CustomerProductGetUseCase _productGetUseCase;

  CustomerSearchBloc({
    required CustomerMerchantGetUseCase getMerchantUseCase,
    required CustomerProductGetUseCase productGetUseCase,
  }) : _merchantGetUseCase = getMerchantUseCase,
       _productGetUseCase = productGetUseCase,
       super(const CustomerSearchState()) {
    on<CustomerSearchQuerySubmitted>(_onSearchQuerySubmitted);
    on<CustomerSearchQueryCleared>(_onSearchQueryCleared);
    on<CustomerSearchFilterRemoved>(_onSearchFilterRemoved);
    on<CustomerSearchShowAllMerchantsToggled>(_onShowAllMerchantsToggled);
  }

  void _onShowAllMerchantsToggled(
    CustomerSearchShowAllMerchantsToggled event,
    Emitter<CustomerSearchState> emit,
  ) {
    emit(state.copyWith(showAllMerchants: !state.showAllMerchants));
  }

  Future<void> _onSearchQuerySubmitted(
    CustomerSearchQuerySubmitted event,
    Emitter<CustomerSearchState> emit,
  ) async {
    if (event.query.isEmpty) return;
    emit(
      state.copyWith(
        isLoading: true,
        showResults: true,
        searchQuery: event.query,
        errorMessage: null,
        showAllMerchants: false,
      ),
    );

    final productResult = await _productGetUseCase.call(keyword: event.query);
    final merchantResult = await _merchantGetUseCase.call(keyword: event.query);
    
    if (productResult.success && merchantResult.success) {
      emit(state.copyWith(
        isLoading: false, 
        products: productResult.data,
        merchants: merchantResult.data,
      ));
    } else {
      emit(state.copyWith(
        isLoading: false, 
        errorMessage: productResult.message ?? merchantResult.message,
      ));
    }
  }

  void _onSearchQueryCleared(
    CustomerSearchQueryCleared event,
    Emitter<CustomerSearchState> emit,
  ) {
    emit(state.copyWith(showResults: false, searchQuery: ''));
  }

  void _onSearchFilterRemoved(
    CustomerSearchFilterRemoved event,
    Emitter<CustomerSearchState> emit,
  ) {
    final updatedFilters = List<String>.from(state.activeFilters)
      ..remove(event.filter);
    emit(state.copyWith(activeFilters: updatedFilters));
  }
}
