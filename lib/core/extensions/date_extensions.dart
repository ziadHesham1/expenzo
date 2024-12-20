import 'package:intl/intl.dart';

extension DateExtensions on DateTime {
  static DateTime now = DateTime.now();
  String get toServerFormat {
    // Define the desired format
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    return formatter.format(this);
  }

  String get toDayNameDateFormat {
    // Define the desired format (day name followed by date)
    final DateFormat formatter = DateFormat('EEEE, yyyy-MM-dd');
    return formatter.format(this);
  }

//-----------------------------------------
  bool isBeforeOrEqual(DateTime other) =>
      isBefore(other) || isAtSameMomentAs(other);

  DateTime get firstDayInWeek {
    return now.subtract(Duration(days: now.weekday + 1));
  }

  DateTime get lastDayOfCurrentMonth {
    // Get the first day of the next month
    DateTime firstDayOfNextMonth = (now.month < 12)
        ? DateTime(now.year, now.month + 1, 1)
        : DateTime(now.year + 1, 1, 1);
    return firstDayOfNextMonth.subtract(const Duration(days: 1));
  }

  int get monthRemainingDays {
    // Calculate days left in the current month
    int daysLeft = lastDayOfCurrentMonth.difference(now).inDays;

    print('date_extensions > ' 'Days left in the current month: $daysLeft');
    return daysLeft;
  }

  int get monthRemainingWeeks {
    // Start from the current date
    DateTime nextFriday = now;

    // Find the next Friday (Weekday 5 in Dart, where Monday is 1)
    while (nextFriday.weekday != DateTime.friday) {
      nextFriday = nextFriday.add(const Duration(days: 1));
    }

    // Count the number of Fridays from the next Friday to the end of the month
    int fridaysLeft = 0;
    while (nextFriday.isBeforeOrEqual(lastDayOfCurrentMonth)) {
      fridaysLeft++;
      nextFriday = nextFriday.add(const Duration(days: 7));
    }

    print(
        'date_extensions > ' 'Fridays left in the current month: $fridaysLeft');
    return fridaysLeft;
  }
}
