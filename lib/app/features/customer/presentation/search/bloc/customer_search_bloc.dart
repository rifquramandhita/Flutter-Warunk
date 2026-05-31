import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_merchant_get_use_case.dart';
import 'customer_search_event.dart';
import 'customer_search_state.dart';

class CustomerSearchBloc extends Bloc<CustomerSearchEvent, CustomerSearchState> {
  final CustomerMerchantGetUseCase _getMerchantUseCase;

  CustomerSearchBloc({required CustomerMerchantGetUseCase getMerchantUseCase})
      : _getMerchantUseCase = getMerchantUseCase,
        super(const CustomerSearchState()) {
    on<CustomerSearchMerchantsFetched>(_onSearchMerchantsFetched);
    on<CustomerSearchQuerySubmitted>(_onSearchQuerySubmitted);
    on<CustomerSearchQueryCleared>(_onSearchQueryCleared);
    on<CustomerSearchFilterRemoved>(_onSearchFilterRemoved);
  }

  Future<void> _onSearchMerchantsFetched(
    CustomerSearchMerchantsFetched event,
    Emitter<CustomerSearchState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final result = await _getMerchantUseCase();
    if (result.success) {
      emit(state.copyWith(
        isLoading: false,
        merchants: result.data,
      ));
    } else {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: result.message,
      ));
    }
  }

  void _onSearchQuerySubmitted(CustomerSearchQuerySubmitted event, Emitter<CustomerSearchState> emit) {
    if (event.query.isEmpty) return;
    emit(state.copyWith(showResults: true, searchQuery: event.query));
  }

  void _onSearchQueryCleared(CustomerSearchQueryCleared event, Emitter<CustomerSearchState> emit) {
    emit(state.copyWith(showResults: false, searchQuery: ''));
  }

  void _onSearchFilterRemoved(CustomerSearchFilterRemoved event, Emitter<CustomerSearchState> emit) {
    final updatedFilters = List<String>.from(state.activeFilters)..remove(event.filter);
    emit(state.copyWith(activeFilters: updatedFilters));
  }
}
