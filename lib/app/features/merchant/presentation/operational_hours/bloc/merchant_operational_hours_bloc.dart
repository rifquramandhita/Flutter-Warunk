import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_merchant_get_use_case.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_merchant_open_use_case.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_merchant_close_use_case.dart';
import 'package:warunk/core/network/data_state.dart';

part 'merchant_operational_hours_event.dart';
part 'merchant_operational_hours_state.dart';

class MerchantOperationalHoursBloc
    extends Bloc<MerchantOperationalHoursEvent, MerchantOperationalHoursState> {
  final MerchantMerchantGetUseCase _getUseCase;
  final MerchantMerchantOpenUseCase _openUseCase;
  final MerchantMerchantCloseUseCase _closeUseCase;

  MerchantOperationalHoursBloc({
    required MerchantMerchantGetUseCase getUseCase,
    required MerchantMerchantOpenUseCase openUseCase,
    required MerchantMerchantCloseUseCase closeUseCase,
  })  : _getUseCase = getUseCase,
        _openUseCase = openUseCase,
        _closeUseCase = closeUseCase,
        super(const MerchantOperationalHoursState()) {
    on<MerchantOperationalHoursEventGet>(_onGet);
    on<MerchantOperationalHoursEventStoreStatusToggled>(_onStoreStatusToggled);
    on<MerchantOperationalHoursEventDayToggled>(_onDayToggled);
    on<MerchantOperationalHoursEventStartTimeChanged>(_onStartTimeChanged);
    on<MerchantOperationalHoursEventEndTimeChanged>(_onEndTimeChanged);
    on<MerchantOperationalHoursEventPreorderToggled>(_onPreorderToggled);
    on<MerchantOperationalHoursEventAutoCloseToggled>(_onAutoCloseToggled);
    on<MerchantOperationalHoursEventSaved>(_onSaved);
  }

  Future<void> _onGet(
    MerchantOperationalHoursEventGet event,
    Emitter<MerchantOperationalHoursState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await _getUseCase();
    if (result is SuccessState) {
      final merchant = result.data!;
      emit(state.copyWith(
        isLoading: false,
        isStoreOpen: merchant.isOpen,
      ));
    } else {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: result.message,
      ));
    }
  }

  void _onStoreStatusToggled(
    MerchantOperationalHoursEventStoreStatusToggled event,
    Emitter<MerchantOperationalHoursState> emit,
  ) {
    emit(state.copyWith(isStoreOpen: !state.isStoreOpen));
  }

  void _onDayToggled(
    MerchantOperationalHoursEventDayToggled event,
    Emitter<MerchantOperationalHoursState> emit,
  ) {
    final newDays = List<DailyHours>.from(state.dailyHours);
    final day = newDays[event.dayIndex];
    newDays[event.dayIndex] = day.copyWith(isOpen: !day.isOpen);
    emit(state.copyWith(dailyHours: newDays));
  }

  void _onStartTimeChanged(
    MerchantOperationalHoursEventStartTimeChanged event,
    Emitter<MerchantOperationalHoursState> emit,
  ) {
    final newDays = List<DailyHours>.from(state.dailyHours);
    final day = newDays[event.dayIndex];
    newDays[event.dayIndex] = day.copyWith(startTime: event.time);
    emit(state.copyWith(dailyHours: newDays));
  }

  void _onEndTimeChanged(
    MerchantOperationalHoursEventEndTimeChanged event,
    Emitter<MerchantOperationalHoursState> emit,
  ) {
    final newDays = List<DailyHours>.from(state.dailyHours);
    final day = newDays[event.dayIndex];
    newDays[event.dayIndex] = day.copyWith(endTime: event.time);
    emit(state.copyWith(dailyHours: newDays));
  }

  void _onPreorderToggled(
    MerchantOperationalHoursEventPreorderToggled event,
    Emitter<MerchantOperationalHoursState> emit,
  ) {
    emit(state.copyWith(acceptPreorder: !state.acceptPreorder));
  }

  void _onAutoCloseToggled(
    MerchantOperationalHoursEventAutoCloseToggled event,
    Emitter<MerchantOperationalHoursState> emit,
  ) {
    emit(state.copyWith(autoClose: !state.autoClose));
  }

  Future<void> _onSaved(
    MerchantOperationalHoursEventSaved event,
    Emitter<MerchantOperationalHoursState> emit,
  ) async {
    emit(state.copyWith(isSaving: true, errorMessage: null));
    DataState result;
    if (state.isStoreOpen) {
      result = await _openUseCase();
    } else {
      result = await _closeUseCase();
    }

    if (result is SuccessState) {
      emit(state.copyWith(isSaving: false, isSaved: true));
    } else {
      emit(state.copyWith(isSaving: false, errorMessage: result.message));
    }
  }
}
