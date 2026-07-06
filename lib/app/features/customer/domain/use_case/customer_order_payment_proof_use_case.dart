import 'dart:io';

import 'package:warunk/app/features/customer/domain/repository/customer_order_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class CustomerOrderPaymentProofUseCase {
  final CustomerOrderRepository _repository;

  CustomerOrderPaymentProofUseCase(this._repository);

  Future<DataState<dynamic>> call(String id, File paymentProof) {
    return _repository.submitPaymentProof(id, paymentProof);
  }
}
