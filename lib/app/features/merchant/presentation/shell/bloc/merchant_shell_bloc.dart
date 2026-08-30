import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_order_get_use_case.dart';
import 'package:warunk/core/enum/order_status.dart';
import 'package:warunk/core/network/data_state.dart';

part 'merchant_shell_event.dart';
part 'merchant_shell_state.dart';

class MerchantShellBloc extends Bloc<MerchantShellEvent, MerchantShellState> {
  final MerchantOrderGetUseCase _getOrderUseCase;

  MerchantShellBloc(this._getOrderUseCase) : super(const MerchantShellState()) {
    on<MerchantShellEventTabChanged>((event, emit) {
      emit(state.copyWith(currentIndex: event.index));
    });

    on<MerchantShellEventGetOrderCount>(_onGetOrderCount);
  }

  Future<void> _onGetOrderCount(
    MerchantShellEventGetOrderCount event,
    Emitter<MerchantShellState> emit,
  ) async {
    final response = await _getOrderUseCase.call();
    if (response is SuccessState) {
      final orders = response.data ?? [];
      final waitingCount =
          orders
              .where(
                (o) => o.status == OrderStatus.waitingMerchantConfirmation,
              )
              .length;
      emit(state.copyWith(waitingOrderCount: waitingCount));
    }
  }
}
