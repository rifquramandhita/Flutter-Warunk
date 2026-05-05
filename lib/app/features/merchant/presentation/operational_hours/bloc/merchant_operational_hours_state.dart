part of 'merchant_operational_hours_bloc.dart';

class DailyHours {
  final String dayName;
  final bool isOpen;
  final String startTime;
  final String endTime;

  const DailyHours({
    required this.dayName,
    required this.isOpen,
    required this.startTime,
    required this.endTime,
  });

  DailyHours copyWith({
    String? dayName,
    bool? isOpen,
    String? startTime,
    String? endTime,
  }) {
    return DailyHours(
      dayName: dayName ?? this.dayName,
      isOpen: isOpen ?? this.isOpen,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
    );
  }
}

class MerchantOperationalHoursState {
  final bool isStoreOpen;
  final List<DailyHours> dailyHours;
  final bool acceptPreorder;
  final bool autoClose;
  final bool isSaving;
  final bool isSaved;

  static const List<String> timeOptions = [
    '06:00', '07:00', '08:00', '09:00', '10:00', '11:00',
    '12:00', '13:00', '14:00', '15:00', '16:00', '17:00',
    '18:00', '19:00', '20:00', '21:00', '22:00', '23:00', '00:00'
  ];

  const MerchantOperationalHoursState({
    this.isStoreOpen = true,
    this.dailyHours = const [
      DailyHours(dayName: 'Senin', isOpen: true, startTime: '08:00', endTime: '22:00'),
      DailyHours(dayName: 'Selasa', isOpen: true, startTime: '08:00', endTime: '22:00'),
      DailyHours(dayName: 'Rabu', isOpen: true, startTime: '08:00', endTime: '22:00'),
      DailyHours(dayName: 'Kamis', isOpen: true, startTime: '08:00', endTime: '22:00'),
      DailyHours(dayName: 'Jumat', isOpen: true, startTime: '08:00', endTime: '23:00'),
      DailyHours(dayName: 'Sabtu', isOpen: true, startTime: '09:00', endTime: '23:00'),
      DailyHours(dayName: 'Minggu', isOpen: false, startTime: '09:00', endTime: '22:00'),
    ],
    this.acceptPreorder = true,
    this.autoClose = true,
    this.isSaving = false,
    this.isSaved = false,
  });

  MerchantOperationalHoursState copyWith({
    bool? isStoreOpen,
    List<DailyHours>? dailyHours,
    bool? acceptPreorder,
    bool? autoClose,
    bool? isSaving,
    bool? isSaved,
  }) {
    return MerchantOperationalHoursState(
      isStoreOpen: isStoreOpen ?? this.isStoreOpen,
      dailyHours: dailyHours ?? this.dailyHours,
      acceptPreorder: acceptPreorder ?? this.acceptPreorder,
      autoClose: autoClose ?? this.autoClose,
      isSaving: isSaving ?? this.isSaving,
      isSaved: isSaved ?? this.isSaved,
    );
  }
}
