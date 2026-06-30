import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_merchant_get_use_case.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_product_get_use_case.dart';
import 'customer_search_event.dart';
import 'customer_search_state.dart';

class CustomerSearchBloc
    extends Bloc<CustomerSearchEvent, CustomerSearchState> {
  final CustomerProductGetUseCase _productGetUseCase;

  CustomerSearchBloc({
    required CustomerMerchantGetUseCase getMerchantUseCase,
    required CustomerProductGetUseCase productGetUseCase,
  }) : _productGetUseCase = productGetUseCase,
       super(const CustomerSearchState()) {
    on<CustomerSearchQuerySubmitted>(_onSearchQuerySubmitted);
    on<CustomerSearchQueryCleared>(_onSearchQueryCleared);
    on<CustomerSearchFilterRemoved>(_onSearchFilterRemoved);
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
      ),
    );

    final result = await _productGetUseCase.call(keyword: event.query);
    if (result.success) {
      emit(state.copyWith(isLoading: false, products: result.data));
    } else {
      emit(state.copyWith(isLoading: false, errorMessage: result.message));
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
