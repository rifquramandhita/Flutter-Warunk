import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_order.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_order_get_by_id_use_case.dart';
import 'package:warunk/core/network/data_state.dart';

part 'customer_detail_order_event.dart';
part 'customer_detail_order_state.dart';

class CustomerDetailOrderBloc
    extends Bloc<CustomerDetailOrderEvent, CustomerDetailOrderState> {
  final CustomerOrderGetByIdUseCase _getByIdUseCase;

  CustomerDetailOrderBloc(this._getByIdUseCase)
    : super(const CustomerDetailOrderState()) {
    on<CustomerDetailOrderFetchStarted>(_onFetchStarted);
    on<CustomerDetailOrderTrackOrder>(_onTrackOrder);
    on<CustomerDetailOrderContactMerchant>(_onContactMerchant);
  }

  Future<void> _onFetchStarted(
    CustomerDetailOrderFetchStarted event,
    Emitter<CustomerDetailOrderState> emit,
  ) async {
    emit(state.copyWith(transaction: event.transaction, isLoading: true));

    final id = event.transaction.id;
    if (id == null) {
      emit(state.copyWith(isLoading: false, errorMessage: 'ID Transaksi tidak ditemukan'));
      return;
    }

    final response = await _getByIdUseCase.call(id: id);

    if (response is SuccessState) {
      emit(state.copyWith(transaction: response.data, isLoading: false, errorMessage: null));
    } else {
      emit(state.copyWith(isLoading: false, errorMessage: response.message));
    }
  }

  void _onTrackOrder(
    CustomerDetailOrderTrackOrder event,
    Emitter<CustomerDetailOrderState> emit,
  ) {
    /* navigate to tracking */
  }

  void _onContactMerchant(
    CustomerDetailOrderContactMerchant event,
    Emitter<CustomerDetailOrderState> emit,
  ) {
    /* open chat */
  }
}
