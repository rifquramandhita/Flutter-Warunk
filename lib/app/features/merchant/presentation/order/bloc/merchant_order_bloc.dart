import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_order.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_order_get_use_case.dart';
import 'package:warunk/core/network/data_state.dart';

part 'merchant_order_event.dart';
part 'merchant_order_state.dart';

class MerchantOrderBloc extends Bloc<MerchantOrderEvent, MerchantOrderState> {
  final MerchantOrderGetUseCase _getUseCase;

  MerchantOrderBloc({required MerchantOrderGetUseCase getUseCase})
    : _getUseCase = getUseCase,
      super(const MerchantOrderState()) {
    on<MerchantOrderEventGet>(_onGet);
    on<MerchantOrderEventTabChanged>(_onTabChanged);
  }

  Future<void> _onGet(
    MerchantOrderEventGet event,
    Emitter<MerchantOrderState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final response = await _getUseCase.call();

    if (response is SuccessState) {
      final orders = response.data ?? [];
      final tabs = orders
          .map((e) => e.status?.value ?? '')
          .where((s) => s.isNotEmpty)
          .toSet()
          .toList();
      tabs.insert(0, ''); // Add 'Semua' tab
      String selected = state.selectedTab;
      if (!tabs.contains(selected) && tabs.isNotEmpty) {
        selected = tabs.first;
      }

      emit(
        state.copyWith(
          isSuccess: true,
          allOrders: orders,
          availableTabs: tabs,
          selectedTab: selected,
        ),
      );
    } else {
      emit(state.copyWith(errorMessage: response.message));
    }

    emit(state.copyWith(isLoading: false));
  }

  void _onTabChanged(
    MerchantOrderEventTabChanged event,
    Emitter<MerchantOrderState> emit,
  ) {
    emit(state.copyWith(selectedTab: event.status));
  }
}
