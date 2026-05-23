part of 'merchant_operational_hours_bloc.dart';

sealed class MerchantOperationalHoursEvent {}

class MerchantOperationalHoursEventGet extends MerchantOperationalHoursEvent {}

class MerchantOperationalHoursEventStoreStatusToggled extends MerchantOperationalHoursEvent {}

class MerchantOperationalHoursEventDayToggled extends MerchantOperationalHoursEvent {
  final int dayIndex;
  MerchantOperationalHoursEventDayToggled(this.dayIndex);
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

class MerchantOperationalHoursEventPreorderToggled extends MerchantOperationalHoursEvent {}

class MerchantOperationalHoursEventAutoCloseToggled extends MerchantOperationalHoursEvent {}

class MerchantOperationalHoursEventSaved extends MerchantOperationalHoursEvent {}
