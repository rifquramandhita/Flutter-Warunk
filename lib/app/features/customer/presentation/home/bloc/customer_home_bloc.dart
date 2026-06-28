import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_merchant_category.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_merchant_get_category_use_case.dart';
import 'package:warunk/core/network/data_state.dart';

part 'customer_home_event.dart';
part 'customer_home_state.dart';

class CustomerHomeBloc extends Bloc<CustomerHomeEvent, CustomerHomeState> {
  final CustomerMerchantGetCategoryUseCase _getCategoryUseCase;

  CustomerHomeBloc({
    required CustomerMerchantGetCategoryUseCase getCategoryUseCase,
  }) : _getCategoryUseCase = getCategoryUseCase,
       super(const CustomerHomeState()) {
    on<CustomerHomeBannerChanged>(_onBannerChanged);
    on<CustomerHomeGetCategoriesStarted>(_onGetCategoriesStarted);
  }

  void _onBannerChanged(
    CustomerHomeBannerChanged event,
    Emitter<CustomerHomeState> emit,
  ) {
    emit(state.copyWith(currentBanner: event.index));
  }

  Future<void> _onGetCategoriesStarted(
    CustomerHomeGetCategoriesStarted event,
    Emitter<CustomerHomeState> emit,
  ) async {
    emit(state.copyWith(isLoadingCategories: true, errorMessage: null));

    final result = await _getCategoryUseCase();

    if (result is ErrorState) {
      emit(
        state.copyWith(
          isLoadingCategories: false,
          errorMessage: result.message,
        ),
      );
    } else {
      emit(
        state.copyWith(
          isLoadingCategories: false,
          categories: result.data ?? [],
        ),
      );
    }
  }
}
