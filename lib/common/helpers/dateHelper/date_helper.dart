class DateHelper {
  static const String dateOne = 'DateOne';
  static const String dateTwo = 'DateTwo';
  static const String equal = 'Equal';

  static String compareTwoDateWithoutTime(DateTime date1, DateTime date2) {
    //if date 1 is greater it will return true, otherwise false
    if (date1.year == date2.year) {
      if (date1.month == date2.month) {
        if (date1.day == date2.day) {
          return equal;
        } else if (date1.day > date2.day) {
          return dateOne;
        } else if (date1.day < date2.day) {
          return dateTwo;
        }
      } else if (date1.month > date2.month) {
        return dateOne;
      } else if (date1.month < date2.month) {
        return dateTwo;
      }
    } else if (date1.year > date2.year) {
      return dateOne;
    }
    return dateTwo;
  }

  static bool checkDateForNewFinancialYearStart() {
    int year = DateTime.now().year;
    // if (DateTime.now() == DateTime(year, DateTime.april, 1)) {
    //   return true;
    // }
    // return false;

    if (DateHelper.compareTwoDateWithoutTime(
            DateTime.now(), DateTime(year + 1, DateTime.april, 29)) ==
        'Equal') {
      return true;
    }

    return false;
  }

  //---To get the Last of the given Month
  //---Get the number of days of a given month
  static DateTime getNumberOfDayOfMonth(int year, int month) {
    if (month % 2 == 0) {
      //---even month
      if (month == DateTime.february) {
        return DateTime(year, month, 28);
      } else {
        return DateTime(year, month, 30);
      }
    }
    return DateTime(year, month, 31);
  }

  //Get number of weeks along with the remaining days
  static int getNumberOfWeekOfAMonth(int month) {
    if (month == 2) {
      //if it is february
      return 4;
    } else {
      return 5;
    }
  }

  //Get position of date in a month
  static int dateInAWeek({required int month, required int day}) {
    //get number of weeks of a month
    if (month == 2) {
      switch (day) {
        case 1 - 7:
          return 1;
        case 8 - 14:
          return 2;
        case 15 - 21:
          return 3;
        case 22 - 28:
          return 4;
      }
    } else {
      switch (day) {
        case 1 - 7:
          return 1;
        case 8 - 14:
          return 2;
        case 15 - 21:
          return 3;
        case 22 - 28:
          return 4;
      }
    }
    return 5;
  }

  // ------This will return the date

//Get startDate of Accounting Year
  static DateTime getStartDateOfAccountingYear() {
    DateTime now = DateTime.now();
    // Start Date is the month of march of every Year

    switch (now.month) {
      case 1: // January
        return DateTime(now.year - 1, now.month + 3, 1);

      case 2: //February
        return DateTime(now.year - 1, now.month + 2, 1);

      case 3: //March
        return DateTime(now.year - 1, now.month + 1, 1);
      case 4: //April
        return DateTime(now.year, now.month, 1);
      case 5: //May
        return DateTime(now.year, now.month - 1, 1);
      case 6: //June
        return DateTime(now.year, now.month - 2, 1);
      case 7: //July
        return DateTime(now.year, now.month - 3, 1);
      case 8: //August
        return DateTime(now.year, now.month - 4, 1);
      case 9: //September
        return DateTime(now.year, now.month - 5, 1);
      case 10: //October
        return DateTime(now.year, now.month - 6, 1);
      case 11: //November
        return DateTime(now.year, now.month - 7, 1);
      default: //December
        return DateTime(now.year, now.month - 8, 1);
    }
  }

//Get endDate of Accounting Year
  static DateTime getEndDateOfAccountingYear() {
    DateTime now = DateTime.now();

    switch (now.month) {
      case 1: // January
        DateTime endDate = DateTime(now.year, 3, 31, 23, 59, 99, 99);
        // printEndDate(endDate);
        return endDate;

      case 2: //February
        DateTime endDate = DateTime(now.year, 3, 31, 23, 59, 99, 99);
        // printEndDate(endDate);
        return endDate;
      case 3: //March
        DateTime endDate = DateTime(now.year, 3, 31, 23, 59, 99, 99);
        // printEndDate(endDate);
        return endDate;
      case 4: //April
        //----For testing purpose
        // DateTime endDate = DateTime.now();
        // printEndDate(endDate);
        //-----Correct Version---
        DateTime endDate = DateTime(now.year + 1, 3, 31, 23, 59, 59, 999);

        return endDate;
      case 5: //May
        DateTime endDate = DateTime(now.year + 1, 3, 31, 23, 59, 59, 999);
        // printEndDate(endDate);
        return endDate;
      case 6: //June
        DateTime endDate = DateTime(now.year + 1, 3, 31, 23, 59, 59, 999);
        // printEndDate(endDate);
        return endDate;
      case 7: //July
        DateTime endDate = DateTime(now.year + 1, 3, 31, 23, 59, 59, 999);
        // printEndDate(endDate);
        return endDate;
      case 8: //August
        DateTime endDate = DateTime(now.year + 1, 3, 31, 23, 59, 59, 999);
        // printEndDate(endDate);
        return endDate;
      case 9: //September
        DateTime endDate = DateTime(now.year + 1, 3, 31, 23, 59, 59, 999);
        // printEndDate(endDate);
        return endDate;

      case 10: //October
        DateTime endDate = DateTime(now.year + 1, 3, 31, 23, 59, 59, 999);
        // printEndDate(endDate);
        return endDate;
      case 11: //November
        DateTime endDate = DateTime(now.year + 1, 3, 31, 23, 59, 59, 999);
        // printEndDate(endDate);
        return endDate;
      case 12: //December
        DateTime endDate = DateTime(now.year + 1, 3, 31, 23, 59, 59, 999);
        // printEndDate(endDate);
        return endDate;
      default:
        return DateTime.now();
    }
  }

  //Get the startDate of the week
  DateTime getWeekStartDate() {
    DateTime _date = DateTime.now().subtract(
      Duration(days: DateTime.now().weekday),
    );
    return _date;
  }

//Get the start date of the month
  DateTime getMonthStartDate() {
    DateTime _date = DateTime(DateTime.now().year, DateTime.now().month, 1);
    return _date;
  }
}
