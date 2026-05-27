import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_order_ship_param.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_order_ship_use_case.dart';
import 'package:warunk/core/network/data_state.dart';

part 'merchant_ship_order_event.dart';
part 'merchant_ship_order_state.dart';

class MerchantShipOrderBloc
    extends Bloc<MerchantShipOrderEvent, MerchantShipOrderState> {
  final MerchantOrderShipUseCase _shipUseCase;
  final String orderId;

  MerchantShipOrderBloc({
    required MerchantOrderShipUseCase shipUseCase,
    required this.orderId,
  })  : _shipUseCase = shipUseCase,
        super(const MerchantShipOrderState()) {
    on<MerchantShipOrderEventShip>(_onShip);
  }

  Future<void> _onShip(
    MerchantShipOrderEventShip event,
    Emitter<MerchantShipOrderState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final response = await _shipUseCase.call(
      id: orderId,
      param: event.param,
    );
    if (response is SuccessState) {
      emit(state.copyWith(isSuccess: true, isLoading: false));
    } else {
      emit(state.copyWith(errorMessage: response.message, isLoading: false));
    }
  }
}
