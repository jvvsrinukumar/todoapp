import 'package:intl/intl.dart';

class DateTimeUtil {
  static String toDateTime(DateTime dateTime) {
    final date = DateFormat.yMMMEd().format(dateTime);
    final time = DateFormat.Hm().format(dateTime);
    return '$date $time';
  }

  static String toDateTimeInDMYHS(DateTime dateTime) {
    final date = DateFormat("dd-MM-yyyy hh:mm a").format(dateTime);
    return date;
  }

  static String toDate(DateTime dateTime) {
    final date = DateFormat.yMMMEd().format(dateTime);
    return date;
  }

  static String toTime(DateTime dateTime) {
    final time = DateFormat("h:mma").format(dateTime);
    return time;
  }
}
