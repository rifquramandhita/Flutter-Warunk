import 'package:flutter_bloc/flutter_bloc.dart';
import 'customer_search_event.dart';
import 'customer_search_state.dart';

class CustomerSearchBloc extends Bloc<CustomerSearchEvent, CustomerSearchState> {
  CustomerSearchBloc() : super(const CustomerSearchState()) {
    on<CustomerSearchQuerySubmitted>(_onSearchQuerySubmitted);
    on<CustomerSearchQueryCleared>(_onSearchQueryCleared);
    on<CustomerSearchFilterRemoved>(_onSearchFilterRemoved);
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
