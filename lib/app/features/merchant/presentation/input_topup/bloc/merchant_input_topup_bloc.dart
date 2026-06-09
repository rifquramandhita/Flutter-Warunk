import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_merchant_top_up_balance_use_case.dart';
import 'package:warunk/app/features/merchant/presentation/input_topup/bloc/merchant_input_topup_event.dart';
import 'package:warunk/app/features/merchant/presentation/input_topup/bloc/merchant_input_topup_state.dart';
import 'package:warunk/core/network/data_state.dart';

class MerchantInputTopupBloc
    extends Bloc<MerchantInputTopupEvent, MerchantInputTopupState> {
  final MerchantMerchantTopUpBalanceUseCase _useCase;

  MerchantInputTopupBloc({
    required MerchantMerchantTopUpBalanceUseCase useCase,
  })  : _useCase = useCase,
        super(const MerchantInputTopupState()) {
    on<MerchantInputTopupEventSubmit>(_onSubmit);
  }

  Future<void> _onSubmit(
    MerchantInputTopupEventSubmit event,
    Emitter<MerchantInputTopupState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null, paymentUrl: null));

    final response = await _useCase.call(event.amount);

    if (response is SuccessState) {
      emit(state.copyWith(
        isLoading: false,
        paymentUrl: response.data,
      ));
    } else {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: response.message,
      ));
    }
  }
}
