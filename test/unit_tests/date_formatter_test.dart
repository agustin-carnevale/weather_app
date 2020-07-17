import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/src/utils/date_formatter.dart';

const WEEKDAYS = ['Monday', 'Tuesday', 'Wednesday','Thursday','Friday','Saturday','Sunday'];
const WEEKDAYS_ABBREV = ['Mon', 'Tue', 'Wed','Thu','Fri','Sat','Sun'];
const MONTHS_ABBREV = ['Jan', 'Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];

main() {
  group('Complete date format - GB Locale', (){
    setUp(() async {
      //Setup Locale just to be sure we use english and GB date format
      Intl.defaultLocale = 'en_GB';
      await initializeDateFormatting(Intl.defaultLocale, null);
    });
    test('specific date',(){
      final DateTime date = DateTime.parse("2020-07-15");
      expect(DateFormatter.date(date), 'Wed, 15 Jul 2020');
    });
    test('today generic',(){
      final DateTime date = DateTime.now();
      final weekDay = date.weekday;
      final day = date.day;
      final month = date.month;
      final year = date.year;
      final expectedString = '${WEEKDAYS_ABBREV[weekDay-1]}, $day ${MONTHS_ABBREV[month-1]} $year';
      expect(DateFormatter.date(date), expectedString);
    });
  });

  group('Only week day format - GB Locale', (){
    setUp(() async {
      Intl.defaultLocale = 'en_GB';
      await initializeDateFormatting(Intl.defaultLocale, null);
    });
    test('specific date',(){
      final DateTime date = DateTime.parse("2020-07-15"); //Wednesday
      expect(DateFormatter.day(date), 'Wednesday');
    });

    test('today generic',(){
      final DateTime date = DateTime.now();
      final weekDay = date.weekday;
      final expectedString = '${WEEKDAYS[weekDay-1]}';
      expect(DateFormatter.day(date), expectedString);
    });
  });

  //Just an example to see that it also works for other Languages if you change the Locale
  group('Only week day format - IT Locale', (){
    setUp(() async {
      //Setup Locale in Italian to test the dayOfWeek 
      Intl.defaultLocale = 'it_IT';
      await initializeDateFormatting(Intl.defaultLocale, null);
    });
    test('specific date',(){
      final DateTime date = DateTime.parse("2020-07-15"); //Wednesday = mercoledì (italian)
      expect(DateFormatter.day(date), 'mercoledì');
    });
  });
} 
