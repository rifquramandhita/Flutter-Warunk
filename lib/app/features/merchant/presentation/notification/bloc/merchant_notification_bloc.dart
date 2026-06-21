import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_notification.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_notification_get_use_case.dart';
import 'package:warunk/core/network/data_state.dart';

part 'merchant_notification_event.dart';
part 'merchant_notification_state.dart';

class MerchantNotificationBloc
    extends Bloc<MerchantNotificationEvent, MerchantNotificationState> {
  final MerchantNotificationGetUseCase _getUseCase;

  MerchantNotificationBloc({required MerchantNotificationGetUseCase getUseCase})
    : _getUseCase = getUseCase,
      super(const MerchantNotificationState(items: [])) {
    on<MerchantNotificationEventLoad>(_onLoad);
  }

  Future<void> _onLoad(
    MerchantNotificationEventLoad event,
    Emitter<MerchantNotificationState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await _getUseCase();

    if (result is SuccessState) {
      final items = result.data?.notifications ?? [];
      emit(state.copyWith(isLoading: false, items: items));
    } else {
      emit(state.copyWith(isLoading: false, errorMessage: result.message));
    }
  }
}
