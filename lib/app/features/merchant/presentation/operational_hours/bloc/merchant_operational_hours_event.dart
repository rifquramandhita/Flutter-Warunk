part of 'merchant_operational_hours_bloc.dart';

sealed class MerchantOperationalHoursEvent {}

class MerchantOperationalHoursStoreStatusToggled extends MerchantOperationalHoursEvent {}

class MerchantOperationalHoursDayToggled extends MerchantOperationalHoursEvent {
  final int dayIndex;
  MerchantOperationalHoursDayToggled(this.dayIndex);
}

class MerchantOperationalHoursStartTimeChanged extends MerchantOperationalHoursEvent {
  final int dayIndex;
  final String time;
  MerchantOperationalHoursStartTimeChanged(this.dayIndex, this.time);
}

class MerchantOperationalHoursEndTimeChanged extends MerchantOperationalHoursEvent {
  final int dayIndex;
  final String time;
  MerchantOperationalHoursEndTimeChanged(this.dayIndex, this.time);
}

class MerchantOperationalHoursPreorderToggled extends MerchantOperationalHoursEvent {}

class MerchantOperationalHoursAutoCloseToggled extends MerchantOperationalHoursEvent {}

class MerchantOperationalHoursSaved extends MerchantOperationalHoursEvent {}
