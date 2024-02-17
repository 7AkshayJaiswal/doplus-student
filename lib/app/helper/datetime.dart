import 'package:intl/intl.dart';

class DateTimeHelper{
  static final DateFormat monthDayYear = DateFormat.yMMMMd();

  static String get currentMonthDayYear => monthDayYear.format(DateTime.now());

}
