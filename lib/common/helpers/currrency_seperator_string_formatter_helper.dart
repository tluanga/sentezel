import 'package:intl/intl.dart';

String currencySeperatorStringFormatterHelper(int? data) {
  String converted;
  if (data != null) {
    converted =
        NumberFormat.currency(symbol: '₹ ', locale: 'Hi', decimalDigits: 0)
            .format(data);
  } else
    converted = '';

  return converted;
}

String currencySeperatorStringFormatterHelperWithoutSymbol(int? data) {
  String converted;
  if (data != null) {
    converted =
        NumberFormat.currency(symbol: '', locale: 'Hi', decimalDigits: 0)
            .format(data);
  } else
    converted = '';

  return converted;
}
