import 'package:base_project_flutter/app/core/constants/app_constants.dart';
import 'package:jiffy/jiffy.dart';

class DateUtils {
  static String formatDateToString(DateTime dateTime) {
    return Jiffy.parseFromDateTime(dateTime)
        .format(pattern: AppConstants.fullDateTimeFormat);
  }

  static String stringFromDate(
      {required DateTime dateTime,
      String format = AppConstants.fullDateTimeFormat}) {
    return Jiffy.parseFromDateTime(dateTime).format(pattern: format);
  }

  static DateTime dateFromString(
      {required String dateString,
      String format = AppConstants.fullDateTimeFormat}) {
    return Jiffy.parse(dateString, pattern: format).dateTime;
  }
}
