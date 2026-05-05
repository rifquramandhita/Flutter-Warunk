import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_transaction_entity.dart';

part 'customer_transaction_detail_event.dart';
part 'customer_transaction_detail_state.dart';

class CustomerTransactionDetailBloc
    extends Bloc<CustomerTransactionDetailEvent, CustomerTransactionDetailState> {
  CustomerTransactionDetailBloc(CustomerTransactionEntity tx)
    : super(CustomerTransactionDetailState(tx)) {
    on<CustomerTransactionDetailTrackOrder>((event, emit) {
      /* navigate to tracking */
    });
    on<CustomerTransactionDetailContactMerchant>((event, emit) {
      /* open chat */
    });
  }
}
