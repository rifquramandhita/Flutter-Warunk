import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_order.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_order_get_use_case.dart';
import 'package:warunk/core/network/data_state.dart';
import 'package:warunk/core/enum/order_status.dart';

export 'package:warunk/app/features/customer/domain/entity/customer_order.dart';

part 'customer_order_event.dart';
part 'customer_order_state.dart';

class CustomerOrderBloc extends Bloc<CustomerOrderEvent, CustomerOrderState> {
  final CustomerOrderGetUseCase _getOrdersUseCase;

  CustomerOrderBloc({required CustomerOrderGetUseCase getOrdersUseCase})
      : _getOrdersUseCase = getOrdersUseCase,
        super(const CustomerOrderState()) {
    on<CustomerOrderFetchStarted>(_onFetchStarted);
    on<CustomerOrderDateRangeFilterChanged>(
      (e, emit) => emit(state.copyWith(dateRangeFilter: e.range, clearDateRange: e.range == null)),
    );
    on<CustomerOrderStatusFilterChanged>(
      (e, emit) => emit(state.copyWith(statusFilter: e.filter)),
    );
  }

  Future<void> _onFetchStarted(
    CustomerOrderFetchStarted event,
    Emitter<CustomerOrderState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final result = await _getOrdersUseCase.call();
    if (result is SuccessState) {
      emit(state.copyWith(isLoading: false, orders: result.data));
    } else {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: result.message.isNotEmpty ? result.message : 'Terjadi kesalahan saat memuat pesanan',
      ));
    }
  }
}
