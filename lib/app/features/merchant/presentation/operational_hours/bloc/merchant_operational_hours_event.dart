part of 'merchant_operational_hours_bloc.dart';

sealed class MerchantOperationalHoursEvent {}

class MerchantOperationalHoursEventGet extends MerchantOperationalHoursEvent {}

class MerchantOperationalHoursEventStoreStatusToggled extends MerchantOperationalHoursEvent {}

class MerchantOperationalHoursEventDayToggled extends MerchantOperationalHoursEvent {
  final int dayIndex;
  MerchantOperationalHoursEventDayToggled(this.dayIndex);
}

class MerchantOperationalHoursEventDay24HoursToggled extends MerchantOperationalHoursEvent {
  final int dayIndex;
  MerchantOperationalHoursEventDay24HoursToggled(this.dayIndex);
}

class MerchantOperationalHoursEventStartTimeChanged extends MerchantOperationalHoursEvent {
  final int dayIndex;
  final String time;
  MerchantOperationalHoursEventStartTimeChanged(this.dayIndex, this.time);
}

class MerchantOperationalHoursEventEndTimeChanged extends MerchantOperationalHoursEvent {
  final int dayIndex;
  final String time;
  MerchantOperationalHoursEventEndTimeChanged(this.dayIndex, this.time);
}

class MerchantOperationalHoursEventIsOpenAllDayToggled extends MerchantOperationalHoursEvent {}

class MerchantOperationalHoursEventIsOpen24HoursToggled extends MerchantOperationalHoursEvent {}

class MerchantOperationalHoursEventTimeOpenChanged extends MerchantOperationalHoursEvent {
  final String time;
  MerchantOperationalHoursEventTimeOpenChanged(this.time);
}

class MerchantOperationalHoursEventTimeCloseChanged extends MerchantOperationalHoursEvent {
  final String time;
  MerchantOperationalHoursEventTimeCloseChanged(this.time);
}

class MerchantOperationalHoursEventPreorderToggled extends MerchantOperationalHoursEvent {}

class MerchantOperationalHoursEventAutoCloseToggled extends MerchantOperationalHoursEvent {}

class MerchantOperationalHoursEventSaved extends MerchantOperationalHoursEvent {}
