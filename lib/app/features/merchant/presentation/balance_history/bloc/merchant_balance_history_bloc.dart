import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_balance_history.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_merchant_get_history_balance_use_case.dart';
import 'package:warunk/core/network/data_state.dart';

part 'merchant_balance_history_event.dart';
part 'merchant_balance_history_state.dart';

class MerchantBalanceHistoryBloc
    extends Bloc<MerchantBalanceHistoryEvent, MerchantBalanceHistoryState> {
  final MerchantMerchantGetHistoryBalanceUseCase _useCase;

  MerchantBalanceHistoryBloc({
    required MerchantMerchantGetHistoryBalanceUseCase useCase,
  })  : _useCase = useCase,
        super(const MerchantBalanceHistoryState()) {
    on<MerchantBalanceHistoryEventFetch>(_onFetch);
  }

  Future<void> _onFetch(
    MerchantBalanceHistoryEventFetch event,
    Emitter<MerchantBalanceHistoryState> emit,
  ) async {
    emit(state.copyWith(
      isLoading: true,
      errorMessage: null,
    ));

    final response = await _useCase.call();

    if (response is SuccessState) {
      final summary = response.data;
      final histories = summary?.histories ?? [];
      emit(state.copyWith(
        isLoading: false,
        summary: summary,
        histories: histories,
      ));
    } else {
      emit(state.copyWith(isLoading: false, errorMessage: response.message));
    }
  }
}
