import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_merchant_get_use_case.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_merchant_open_use_case.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_merchant_close_use_case.dart';
import 'package:warunk/app/features/merchant/domain/use_case/merchant_merchant_update_operational_hour_use_case.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_operational_hour.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_operational_hour_item.dart';
import 'package:warunk/core/network/data_state.dart';

part 'merchant_operational_hours_event.dart';
part 'merchant_operational_hours_state.dart';

class MerchantOperationalHoursBloc
    extends Bloc<MerchantOperationalHoursEvent, MerchantOperationalHoursState> {
  final MerchantMerchantGetUseCase _getUseCase;
  final MerchantMerchantOpenUseCase _openUseCase;
  final MerchantMerchantCloseUseCase _closeUseCase;
  final MerchantMerchantUpdateOperationalHourUseCase
  _updateOperationalHourUseCase;

  MerchantOperationalHoursBloc({
    required MerchantMerchantGetUseCase getUseCase,
    required MerchantMerchantOpenUseCase openUseCase,
    required MerchantMerchantCloseUseCase closeUseCase,
    required MerchantMerchantUpdateOperationalHourUseCase
    updateOperationalHourUseCase,
  }) : _getUseCase = getUseCase,
       _openUseCase = openUseCase,
       _closeUseCase = closeUseCase,
       _updateOperationalHourUseCase = updateOperationalHourUseCase,
       super(const MerchantOperationalHoursState()) {
    on<MerchantOperationalHoursEventGet>(_onGet);
    on<MerchantOperationalHoursEventStoreStatusToggled>(_onStoreStatusToggled);
    on<MerchantOperationalHoursEventDayToggled>(_onDayToggled);
    on<MerchantOperationalHoursEventDay24HoursToggled>(_onDay24HoursToggled);
    on<MerchantOperationalHoursEventStartTimeChanged>(_onStartTimeChanged);
    on<MerchantOperationalHoursEventEndTimeChanged>(_onEndTimeChanged);
    on<MerchantOperationalHoursEventIsOpenAllDayToggled>(
      _onIsOpenAllDayToggled,
    );
    on<MerchantOperationalHoursEventIsOpen24HoursToggled>(
      _onIsOpen24HoursToggled,
    );
    on<MerchantOperationalHoursEventTimeOpenChanged>(_onTimeOpenChanged);
    on<MerchantOperationalHoursEventTimeCloseChanged>(_onTimeCloseChanged);
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

      List<DailyHours> updatedDailyHours = List.from(state.dailyHours);
      if (merchant.merchantOpens.isNotEmpty) {
        updatedDailyHours = state.dailyHours.map((day) {
          String dayNameEn = 'monday';
          switch (day.dayName.toLowerCase()) {
            case 'senin':
              dayNameEn = 'monday';
              break;
            case 'selasa':
              dayNameEn = 'tuesday';
              break;
            case 'rabu':
              dayNameEn = 'wednesday';
              break;
            case 'kamis':
              dayNameEn = 'thursday';
              break;
            case 'jumat':
              dayNameEn = 'friday';
              break;
            case 'sabtu':
              dayNameEn = 'saturday';
              break;
            case 'minggu':
              dayNameEn = 'sunday';
              break;
          }
          final match = merchant.merchantOpens.firstWhere(
            (element) => element.day.toLowerCase() == dayNameEn,
            orElse: () => const MerchantOperationalHourItemEntity(
              id: '',
              day: '',
              isClosed: true,
              isOpen24Hours: false,
              timeOpen: '',
              timeClose: '',
            ),
          );
          if (match.day.isNotEmpty) {
            return day.copyWith(
              isOpen: !match.isClosed,
              isOpen24Hours: match.isOpen24Hours,
              startTime: _formatTime(match.timeOpen) ?? day.startTime,
              endTime: _formatTime(match.timeClose) ?? day.endTime,
            );
          }
          return day;
        }).toList();
      }

      emit(
        state.copyWith(
          isLoading: false,
          isStoreOpen: merchant.isOpen,
          isOpenAllDay: merchant.isOpenAllDay ?? false,
          isOpen24Hours: merchant.isOpen24Hours ?? false,
          timeOpen: _formatTime(merchant.timeOpen) ?? '08:00',
          timeClose: _formatTime(merchant.timeClose) ?? '22:00',
          dailyHours: updatedDailyHours,
        ),
      );
    } else {
      emit(state.copyWith(isLoading: false, errorMessage: result.message));
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

  void _onDay24HoursToggled(
    MerchantOperationalHoursEventDay24HoursToggled event,
    Emitter<MerchantOperationalHoursState> emit,
  ) {
    final newDays = List<DailyHours>.from(state.dailyHours);
    final day = newDays[event.dayIndex];
    newDays[event.dayIndex] = day.copyWith(isOpen24Hours: !day.isOpen24Hours);
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

  void _onIsOpenAllDayToggled(
    MerchantOperationalHoursEventIsOpenAllDayToggled event,
    Emitter<MerchantOperationalHoursState> emit,
  ) {
    emit(state.copyWith(isOpenAllDay: !state.isOpenAllDay));
  }

  void _onIsOpen24HoursToggled(
    MerchantOperationalHoursEventIsOpen24HoursToggled event,
    Emitter<MerchantOperationalHoursState> emit,
  ) {
    emit(state.copyWith(isOpen24Hours: !state.isOpen24Hours));
  }

  void _onTimeOpenChanged(
    MerchantOperationalHoursEventTimeOpenChanged event,
    Emitter<MerchantOperationalHoursState> emit,
  ) {
    emit(state.copyWith(timeOpen: event.time));
  }

  void _onTimeCloseChanged(
    MerchantOperationalHoursEventTimeCloseChanged event,
    Emitter<MerchantOperationalHoursState> emit,
  ) {
    emit(state.copyWith(timeClose: event.time));
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

    // Save operational hours
    final List<MerchantOperationalHourItemUpdateParam> merchantOpens = state
        .dailyHours
        .map((d) {
          String dayNameEn = 'monday';
          switch (d.dayName.toLowerCase()) {
            case 'senin':
              dayNameEn = 'monday';
              break;
            case 'selasa':
              dayNameEn = 'tuesday';
              break;
            case 'rabu':
              dayNameEn = 'wednesday';
              break;
            case 'kamis':
              dayNameEn = 'thursday';
              break;
            case 'jumat':
              dayNameEn = 'friday';
              break;
            case 'sabtu':
              dayNameEn = 'saturday';
              break;
            case 'minggu':
              dayNameEn = 'sunday';
              break;
          }
          return MerchantOperationalHourItemUpdateParam(
            day: dayNameEn,
            isClosed: !d.isOpen,
            isOpen24Hours: d.isOpen24Hours,
            timeOpen: (d.isOpen24Hours) ? null : d.startTime,
            timeClose: (d.isOpen24Hours) ? null : d.endTime,
          );
        })
        .toList();

    final param = MerchantOperationalHourUpdateParam(
      isOpenAllDay: state.isOpenAllDay,
      isOpen24Hours: state.isOpen24Hours,
      timeOpen: (state.isOpen24Hours) ? null : state.timeOpen,
      timeClose: (state.isOpen24Hours) ? null : state.timeClose,
      merchantOpens: (state.isOpenAllDay) ? null : merchantOpens,
    );

    final updateResult = await _updateOperationalHourUseCase(param);

    if (updateResult is ErrorState) {
      emit(state.copyWith(isSaving: false, errorMessage: updateResult.message));
      return;
    }

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

  String? _formatTime(String? timeStr) {
    if (timeStr == null || timeStr.isEmpty) return null;
    final parts = timeStr.split(':');
    if (parts.length >= 2) {
      return '${parts[0]}:${parts[1]}';
    }
    return timeStr;
  }
}
