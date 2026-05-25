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
    on<MerchantOrderEventFetchStarted>(_onFetchStarted);
    on<MerchantOrderEventTabChanged>(_onTabChanged);
    on<MerchantOrderEventFilterTapped>(_onFilterTapped);
  }

  Future<void> _onFetchStarted(
    MerchantOrderEventFetchStarted event,
    Emitter<MerchantOrderState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final response = await _getUseCase.call();

    if (response is SuccessState) {
      emit(state.copyWith(
        isSuccess: true,
        allOrders: response.data,
      ));
    } else {
      emit(state.copyWith(errorMessage: response.message));
    }

    emit(state.copyWith(isLoading: false));
  }

  void _onTabChanged(
    MerchantOrderEventTabChanged event,
    Emitter<MerchantOrderState> emit,
  ) {
    emit(state.copyWith(selectedTab: event.index));
  }

  void _onFilterTapped(
    MerchantOrderEventFilterTapped event,
    Emitter<MerchantOrderState> emit,
  ) {
    // TODO: show filter bottom sheet
  }
}
