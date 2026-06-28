import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_merchant_get_use_case.dart';
import 'package:warunk/core/network/data_state.dart';

import 'customer_merchant_event.dart';
import 'customer_merchant_state.dart';

class CustomerMerchantBloc extends Bloc<CustomerMerchantEvent, CustomerMerchantState> {
  final CustomerMerchantGetUseCase _getUseCase;

  CustomerMerchantBloc({
    required CustomerMerchantGetUseCase getUseCase,
  })  : _getUseCase = getUseCase,
        super(const CustomerMerchantState()) {
    on<CustomerMerchantEventGet>(_onGetMerchants);
  }

  Future<void> _onGetMerchants(
    CustomerMerchantEventGet event,
    Emitter<CustomerMerchantState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await _getUseCase(category: event.categorySlug);

    if (result is ErrorState) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: result.message ?? 'Gagal memuat daftar warung',
      ));
    } else {
      emit(state.copyWith(
        isLoading: false,
        merchants: result.data ?? [],
      ));
    }
  }
}
