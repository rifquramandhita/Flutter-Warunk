import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_order.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_order_cancel_use_case.dart';
import 'package:warunk/core/network/data_state.dart';

import 'customer_cancel_order_event.dart';
import 'customer_cancel_order_state.dart';

export 'customer_cancel_order_event.dart';
export 'customer_cancel_order_state.dart';

class CustomerCancelOrderBloc
    extends Bloc<CustomerCancelOrderEvent, CustomerCancelOrderState> {
  final CustomerOrderCancelUseCase cancelUseCase;

  CustomerCancelOrderBloc({required this.cancelUseCase})
    : super(const CustomerCancelOrderState()) {
    on<CustomerCancelOrderSubmitted>(_onSubmitted);
  }

  Future<void> _onSubmitted(
    CustomerCancelOrderSubmitted event,
    Emitter<CustomerCancelOrderState> emit,
  ) async {
    emit(state.copyWith(status: CustomerCancelOrderStatus.loading));

    final param = CustomerOrderCancelParam(
      orderId: event.orderId,
      reason: event.reason,
      customerBank: event.customerBank,
      customerAccountNumber: event.customerAccountNumber,
      customerAccountName: event.customerAccountName,
    );

    final result = await cancelUseCase(params: param);

    if (result is SuccessState) {
      emit(
        state.copyWith(
          status: CustomerCancelOrderStatus.success,
          successMessage: result.data,
        ),
      );
    } else if (result is ErrorState) {
      emit(
        state.copyWith(
          status: CustomerCancelOrderStatus.failure,
          errorMessage: result.message,
        ),
      );
    }
  }
}
