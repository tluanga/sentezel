// ------This will return the date

//Get startDate of Accounting Year
DateTime getStartDateOfAccountingYear() {
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

//Get startDate of Accounting Year
DateTime getEndDateOfAccountingYear() {
  DateTime now = DateTime.now();
  // End Date is the month of April of every Year

  switch (now.month) {
    case 1: // January
      return DateTime(now.year, now.month + 2, 31);
    case 2: //February
      return DateTime(now.year, now.month + 1, 31);
    case 3: //March
      return DateTime(now.year, now.month, 31);
    case 4: //April
      return DateTime(now.year + 1, now.month - 1, 31);
    case 5: //May
      return DateTime(now.year + 1, now.month - 2, 31);
    case 6: //June
      return DateTime(now.year + 1, now.month - 3, 31);
    case 7: //July
      return DateTime(now.year + 1, now.month - 4, 31);
    case 8: //August
      return DateTime(now.year + 1, now.month - 5, 31);
    case 9: //September
      return DateTime(now.year + 1, now.month - 6, 31);
    case 10: //October
      return DateTime(now.year + 1, now.month - 7, 31);
    case 11: //November
      return DateTime(now.year + 1, now.month - 8, 31);
    default: //December
      return DateTime(now.year + 1, now.month - 9, 31);
  }
}
