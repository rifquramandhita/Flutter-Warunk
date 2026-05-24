part of 'merchant_operational_hours_bloc.dart';

class DailyHours extends Equatable {
  final String dayName;
  final bool isOpen;
  final bool isOpen24Hours;
  final String startTime;
  final String endTime;

  const DailyHours({
    required this.dayName,
    required this.isOpen,
    required this.isOpen24Hours,
    required this.startTime,
    required this.endTime,
  });

  DailyHours copyWith({
    String? dayName,
    bool? isOpen,
    bool? isOpen24Hours,
    String? startTime,
    String? endTime,
  }) {
    return DailyHours(
      dayName: dayName ?? this.dayName,
      isOpen: isOpen ?? this.isOpen,
      isOpen24Hours: isOpen24Hours ?? this.isOpen24Hours,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
    );
  }

  @override
  List<Object?> get props => [dayName, isOpen, isOpen24Hours, startTime, endTime];
}

class MerchantOperationalHoursState extends Equatable {
  final bool isStoreOpen;
  final bool isOpenAllDay;
  final bool isOpen24Hours;
  final String timeOpen;
  final String timeClose;
  final List<DailyHours> dailyHours;
  final bool acceptPreorder;
  final bool autoClose;
  final bool isLoading;
  final bool isSaving;
  final bool isSaved;
  final String? errorMessage;

  static const List<String> timeOptions = [
    '06:00', '07:00', '08:00', '09:00', '10:00', '11:00',
    '12:00', '13:00', '14:00', '15:00', '16:00', '17:00',
    '18:00', '19:00', '20:00', '21:00', '22:00', '23:00', '00:00'
  ];

  const MerchantOperationalHoursState({
    this.isStoreOpen = true,
    this.isOpenAllDay = false,
    this.isOpen24Hours = false,
    this.timeOpen = '08:00',
    this.timeClose = '22:00',
    this.dailyHours = const [
      DailyHours(dayName: 'Senin', isOpen: true, isOpen24Hours: false, startTime: '08:00', endTime: '22:00'),
      DailyHours(dayName: 'Selasa', isOpen: true, isOpen24Hours: false, startTime: '08:00', endTime: '22:00'),
      DailyHours(dayName: 'Rabu', isOpen: true, isOpen24Hours: false, startTime: '08:00', endTime: '22:00'),
      DailyHours(dayName: 'Kamis', isOpen: true, isOpen24Hours: false, startTime: '08:00', endTime: '22:00'),
      DailyHours(dayName: 'Jumat', isOpen: true, isOpen24Hours: false, startTime: '08:00', endTime: '23:00'),
      DailyHours(dayName: 'Sabtu', isOpen: true, isOpen24Hours: false, startTime: '09:00', endTime: '23:00'),
      DailyHours(dayName: 'Minggu', isOpen: false, isOpen24Hours: false, startTime: '09:00', endTime: '22:00'),
    ],
    this.acceptPreorder = true,
    this.autoClose = true,
    this.isLoading = false,
    this.isSaving = false,
    this.isSaved = false,
    this.errorMessage,
  });

  MerchantOperationalHoursState copyWith({
    bool? isStoreOpen,
    bool? isOpenAllDay,
    bool? isOpen24Hours,
    String? timeOpen,
    String? timeClose,
    List<DailyHours>? dailyHours,
    bool? acceptPreorder,
    bool? autoClose,
    bool? isLoading,
    bool? isSaving,
    bool? isSaved,
    String? errorMessage,
  }) {
    return MerchantOperationalHoursState(
      isStoreOpen: isStoreOpen ?? this.isStoreOpen,
      isOpenAllDay: isOpenAllDay ?? this.isOpenAllDay,
      isOpen24Hours: isOpen24Hours ?? this.isOpen24Hours,
      timeOpen: timeOpen ?? this.timeOpen,
      timeClose: timeClose ?? this.timeClose,
      dailyHours: dailyHours ?? this.dailyHours,
      acceptPreorder: acceptPreorder ?? this.acceptPreorder,
      autoClose: autoClose ?? this.autoClose,
      isLoading: isLoading ?? this.isLoading,
      isSaving: isSaving ?? this.isSaving,
      isSaved: isSaved ?? this.isSaved,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        isStoreOpen,
        isOpenAllDay,
        isOpen24Hours,
        timeOpen,
        timeClose,
        dailyHours,
        acceptPreorder,
        autoClose,
        isLoading,
        isSaving,
        isSaved,
        errorMessage,
      ];
}
