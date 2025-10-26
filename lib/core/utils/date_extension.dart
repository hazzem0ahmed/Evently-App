import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  DateTime get dateOnly {
    return DateTime(year, month, day);
  }
}

extension IntExtension on int {
  String get formattedDate {
    DateTime date = DateTime.fromMicrosecondsSinceEpoch(this);
    String formatedDate = DateFormat("dd\nMMM").format(date);
    return formatedDate;
  }


}