import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_merchant_category.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_merchant_get_category_use_case.dart';
import 'package:warunk/core/network/data_state.dart';

part 'customer_category_event.dart';
part 'customer_category_state.dart';

class CustomerCategoryBloc extends Bloc<CustomerCategoryEvent, CustomerCategoryState> {
  final CustomerMerchantGetCategoryUseCase _getCategoryUseCase;

  CustomerCategoryBloc({
    required CustomerMerchantGetCategoryUseCase getCategoryUseCase,
  })  : _getCategoryUseCase = getCategoryUseCase,
        super(const CustomerCategoryState()) {
    on<CustomerCategoryStarted>(_onStarted);
    on<CustomerCategorySearchChanged>(_onSearchChanged);
  }

  Future<void> _onStarted(CustomerCategoryStarted event, Emitter<CustomerCategoryState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final result = await _getCategoryUseCase();
    if (result is SuccessState) {
      final categories = result.data?.toList() ?? [];
      categories.insert(
        0,
        const CustomerMerchantCategoryEntity(
          id: 'all',
          name: 'Semua Warung',
          slug: 'all',
        ),
      );
      emit(state.copyWith(isLoading: false, categories: categories));
    } else {
      emit(state.copyWith(isLoading: false, errorMessage: result.message));
    }
  }

  void _onSearchChanged(
    CustomerCategorySearchChanged event,
    Emitter<CustomerCategoryState> emit,
  ) {
    emit(state.copyWith(searchQuery: event.query));
  }
}
