import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_order_get_by_id_use_case.dart';
import 'package:warunk/core/network/data_state.dart';
import 'customer_order_success_event.dart';
import 'customer_order_success_state.dart';

class CustomerOrderSuccessBloc
    extends Bloc<CustomerOrderSuccessEvent, CustomerOrderSuccessState> {
  final CustomerOrderGetByIdUseCase _getOrderByIdUseCase;

  CustomerOrderSuccessBloc({
    required CustomerOrderGetByIdUseCase getOrderByIdUseCase,
  }) : _getOrderByIdUseCase = getOrderByIdUseCase,
       super(const CustomerOrderSuccessState()) {
    on<CustomerLoadOrderSuccessData>(_onLoadOrderSuccessData);
  }

  Future<void> _onLoadOrderSuccessData(
    CustomerLoadOrderSuccessData event,
    Emitter<CustomerOrderSuccessState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final result = await _getOrderByIdUseCase(id: event.orderId);

    if (result is SuccessState) {
      emit(state.copyWith(isLoading: false, order: result.data));
    } else {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: result.message ?? 'Terjadi kesalahan',
        ),
      );
    }
  }
}
