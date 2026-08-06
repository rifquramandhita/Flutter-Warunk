import 'package:intl/intl.dart';

class DateTimeHelper {
  static String formatDateTime({
    DateTime? dateTime,
    String format = 'd MMM yyyy',
  }) {
    if (dateTime == null) return '';
    return DateFormat(format, 'id').format(dateTime.toLocal());
  }

  static String formatDateTimeFromString({
    String? dateTimeString,
    String format = 'd MMM yyyy',
  }) {
    if (dateTimeString == null) return '';
    DateTime dateTime = DateTime.parse(dateTimeString).toLocal();
    return DateFormat(format, 'id').format(dateTime);
  }

  static DateTime? parseDateTime({
    required String? dateTimeString,
    String format = 'dd-MM-yyyy',
  }) {
    if (dateTimeString == null) return null;
    return DateFormat(format, 'id').parse(dateTimeString);
  }

  static bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  static bool isToday(DateTime dateTime) {
    return isSameDay(dateTime, DateTime.now());
  }
}
