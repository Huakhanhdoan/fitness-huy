// extensions on DateTime class

extension DateTimeExtension on DateTime {
  bool isToDay() {
    final now = DateTime.now();
    return day == now.day && month == now.month && year == now.year;
  }

  bool isSameDay(DateTime other) {
    return day == other.day && month == other.month && year == other.year;
  }

  bool isPreviousDay(DateTime other) {
    return isSameDay(other.subtract(const Duration(days: 1)));
  }

  DateTime byDecreaseDays(int days) {
    return subtract(Duration(days: days));
  }

  DateTime byDecreaseHours(int hours) {
    return subtract(Duration(hours: hours));
  }

  DateTime byDecreaseMinutes(int minutes) {
    return subtract(Duration(minutes: minutes));
  }

  DateTime byIncreaseDays(int days) {
    return add(Duration(days: days));
  }

  DateTime byIncreaseHours(int hours) {
    return add(Duration(hours: hours));
  }

  DateTime byIncreaseMinutes(int minutes) {
    return add(Duration(minutes: minutes));
  }
}
