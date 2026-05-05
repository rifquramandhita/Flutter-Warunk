import 'package:flutter_bloc/flutter_bloc.dart';

part 'merchant_operational_hours_event.dart';
part 'merchant_operational_hours_state.dart';

class MerchantOperationalHoursBloc
    extends Bloc<MerchantOperationalHoursEvent, MerchantOperationalHoursState> {
  MerchantOperationalHoursBloc() : super(const MerchantOperationalHoursState()) {
    on<MerchantOperationalHoursStoreStatusToggled>((event, emit) {
      emit(state.copyWith(isStoreOpen: !state.isStoreOpen));
    });

    on<MerchantOperationalHoursDayToggled>((event, emit) {
      final newDays = List<DailyHours>.from(state.dailyHours);
      final day = newDays[event.dayIndex];
      newDays[event.dayIndex] = day.copyWith(isOpen: !day.isOpen);
      emit(state.copyWith(dailyHours: newDays));
    });

    on<MerchantOperationalHoursStartTimeChanged>((event, emit) {
      final newDays = List<DailyHours>.from(state.dailyHours);
      final day = newDays[event.dayIndex];
      newDays[event.dayIndex] = day.copyWith(startTime: event.time);
      emit(state.copyWith(dailyHours: newDays));
    });

    on<MerchantOperationalHoursEndTimeChanged>((event, emit) {
      final newDays = List<DailyHours>.from(state.dailyHours);
      final day = newDays[event.dayIndex];
      newDays[event.dayIndex] = day.copyWith(endTime: event.time);
      emit(state.copyWith(dailyHours: newDays));
    });

    on<MerchantOperationalHoursPreorderToggled>((event, emit) {
      emit(state.copyWith(acceptPreorder: !state.acceptPreorder));
    });

    on<MerchantOperationalHoursAutoCloseToggled>((event, emit) {
      emit(state.copyWith(autoClose: !state.autoClose));
    });

    on<MerchantOperationalHoursSaved>((event, emit) async {
      emit(state.copyWith(isSaving: true));
      await Future<void>.delayed(const Duration(milliseconds: 800));
      emit(state.copyWith(isSaving: false, isSaved: true));
    });
  }
}
