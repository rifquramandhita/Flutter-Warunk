import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_order_payment_proof_use_case.dart';
import 'package:warunk/core/network/data_state.dart';

import 'customer_payment_proof_event.dart';
import 'customer_payment_proof_state.dart';

class CustomerPaymentProofBloc
    extends Bloc<CustomerPaymentProofEvent, CustomerPaymentProofState> {
  final CustomerOrderPaymentProofUseCase _useCase;

  CustomerPaymentProofBloc(this._useCase)
    : super(CustomerPaymentProofInitial()) {
    on<CustomerPaymentProofSubmitted>(_onSubmitted);
  }

  Future<void> _onSubmitted(
    CustomerPaymentProofSubmitted event,
    Emitter<CustomerPaymentProofState> emit,
  ) async {
    emit(CustomerPaymentProofLoading());

    final result = await _useCase(event.orderId, event.file);

    if (result is SuccessState) {
      emit(CustomerPaymentProofSuccess());
    } else if (result is ErrorState) {
      emit(CustomerPaymentProofFailure(result.message));
    }
  }
}
