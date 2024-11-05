import 'package:intl/intl.dart';

class DateFormater {
  static String formateDate(DateTime date) {
    String formattedDate = DateFormat('EEEE, dd, MMMM, yyyy')
        .format(date); // Date in format: Day, DD_Month_YYYY
    String formattedTime =
        DateFormat('hh:mm a').format(date); // Time in format: HH:MM AM/PM
    return "$formattedDate - $formattedTime";
  }
}
