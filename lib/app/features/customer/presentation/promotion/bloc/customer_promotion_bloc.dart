import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_order.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_promotion.dart';
import 'package:warunk/app/features/customer/domain/use_case/customer_order_get_promotion_use_case.dart';
import 'package:warunk/core/network/data_state.dart';

part 'customer_promotion_event.dart';
part 'customer_promotion_state.dart';

class CustomerPromotionBloc
    extends Bloc<CustomerPromotionEvent, CustomerPromotionState> {
  final CustomerOrderGetPromotionUseCase getPromotionUseCase;

  CustomerPromotionBloc({required this.getPromotionUseCase})
    : super(const CustomerPromotionState()) {
    on<CustomerPromotionEventGet>(_onGet);
    on<CustomerPromotionEventApplyCode>(_onApplyCode);
  }

  Future<void> _onGet(
    CustomerPromotionEventGet event,
    Emitter<CustomerPromotionState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final result = await getPromotionUseCase(params: event.param);

    if (result is SuccessState) {
      final data = result.data;
      emit(state.copyWith(isLoading: false, promotions: data!));
    } else {
      emit(state.copyWith(isLoading: false, errorMessage: result.message));
    }
  }

  void _onApplyCode(
    CustomerPromotionEventApplyCode event,
    Emitter<CustomerPromotionState> emit,
  ) {
    emit(state.copyWith(appliedCode: event.code));
  }
}
