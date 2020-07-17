import 'package:intl/intl.dart';

class DateFormatter {
  static String date(DateTime date){
    final formatter = DateFormat('E, dd MMM yyyy');
    return formatter.format(date);
  }

  static String day(DateTime date){
    final formatter = DateFormat('EEEE');
    return formatter.format(date);
  }
}