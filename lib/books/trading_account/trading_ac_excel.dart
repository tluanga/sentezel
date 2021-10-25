import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

import 'trading_account_model.dart';

Future<void> createTradingAcExl(List<TradingAccount> data) async {
  String date = DateFormat('dd_MM_yyyy').format(DateTime.now());
  List columnHeader = ['Particulars', 'Amount', 'Particular', 'Amount'];

  final Workbook workbook = Workbook();
  final Worksheet sheet = workbook.worksheets[0];
  Style headingStyle = workbook.styles.add('style');
  Style columnHeadStyle = workbook.styles.add('hcstyle');

  Style rowStyleBlue = workbook.styles.add('rowstyleblue');
  Style rowStyleWhite = workbook.styles.add('rowstylewhite');

  headingStyle.vAlign = VAlignType.center;
  headingStyle.hAlign = HAlignType.center;
  headingStyle.fontSize = 13;
  columnHeadStyle.hAlign = HAlignType.center;
  columnHeadStyle.backColorRgb = const Color.fromRGBO(0, 117, 221, 1);
  columnHeadStyle.fontColor = '#ffffff';
  rowStyleBlue.backColorRgb = const Color.fromRGBO(227, 242, 253, 1);
  rowStyleWhite.backColorRgb = const Color.fromRGBO(254, 254, 254, 1);

  sheet.getRangeByName('A1').rowHeight = 43;
  sheet.getRangeByName('A1').columnWidth = 35;
  sheet.getRangeByName('B1').columnWidth = 15;
  sheet.getRangeByName('C1').columnWidth = 43;
  sheet.getRangeByName('D1').columnWidth = 15;
  sheet.getRangeByName('A1:D1').merge();
  sheet.getRangeByName('A1:D1').cellStyle = headingStyle;
  //-------------------HEADING------------
  sheet
      .getRangeByName('A1')
      .setText("Trading Account for the year ending  $date");
  //---Column Head implement
  for (int i = 1; i <= columnHeader.length; i++) {
    sheet.getRangeByIndex(2, i).setText(columnHeader[i - 1]);
    sheet.getRangeByIndex(2, i).cellStyle = columnHeadStyle;
  }

  // List of expense and income
  int length;
  if (data[0].directExpense.length > data[0].directIncome.length) {
    length = data[0].directExpense.length;
  } else if (data[0].directIncome.length > data[0].directExpense.length) {
    length = data[0].directIncome.length;
  } else {
    length = data[0].directExpense.length;
  }
  for (int i = 0; i < length; i++) {
    //---------Expense---------
    if (data[0].directExpense.length > i) {
      // row.cells[1].stringFormat.alignment = PdfTextAlignment.center;
      // row.cells[0].value = data[0].directExpense[i].ledgerName;
      sheet.getRangeByIndex(i + 3, 1).value =
          data[0].directExpense[i].ledgerName;
      sheet.getRangeByIndex(i + 3, 2).value =
          (data[0].directExpense[i].totalCredit -
                  data[0].directExpense[i].totalDebit)
              .abs();
    }
    //-------income
    if (data[0].directIncome.length > i) {
      // row.cells[3].stringFormat.alignment = PdfTextAlignment.center;
      sheet.getRangeByIndex(i + 3, 3).value =
          data[0].directIncome[i].ledgerName;
      sheet.getRangeByIndex(i + 3, 4).value =
          (data[0].directIncome[i].totalCredit -
                  data[0].directIncome[i].totalCredit)
              .abs();
    }
  }
  int dataLength = 0;

  if (data[0].directExpense.length > data[0].directIncome.length) {
    dataLength = data[0].directExpense.length + 3;
  } else {
    dataLength = data[0].directExpense.length + 3;
  }
  //   PdfGridRow row = grid.rows.add();
  // row.cells[1].stringFormat.alignment = PdfTextAlignment.center;
  // row.cells[3].stringFormat.alignment = PdfTextAlignment.center;
  if (data[0].grossProfit != 0) {
    sheet.getRangeByIndex(dataLength, 1).value =
        'To Gross Profit transaferred to \nP&L a/c';
    sheet.getRangeByIndex(dataLength, 2).value = data[0].grossProfit;
  }
  if (data[0].grossLoss != 0) {
    sheet.getRangeByIndex(dataLength, 3).value =
        'To Gross Loss transaferred to \nP&L a/c';
    sheet.getRangeByIndex(dataLength, 4).value = data[0].grossLoss;
  }
  // Total still needs to be fixed
  // row.cells[1].stringFormat.alignment = PdfTextAlignment.center;
  // row.cells[3].stringFormat.alignment = PdfTextAlignment.center;
  // row.cells[0].value = 'Total';
  sheet.getRangeByIndex(dataLength + 1, 1).value = 'Total';
  // row.cells[1].value = currencySeperatorStringFormatterHelperWithoutSymbol(0);
  sheet.getRangeByIndex(dataLength + 1, 2).value = data[0].finalExpenseTotal;
  // row.cells[2].value = 'Total';
  sheet.getRangeByIndex(dataLength + 1, 3).value = 'Total';
  // row.cells[3].value = currencySeperatorStringFormatterHelperWithoutSymbol(0);
  sheet.getRangeByIndex(dataLength + 1, 4).value = data[0].finalIncomeTotal;
//---
  // for (var i = 0; i < data.length + 2; i++) {
  //   if (i.isEven) {
  //     sheet.getRangeByIndex(i + 3, 1).cellStyle = rowStyleBlue;
  //     sheet.getRangeByIndex(i + 3, 2).cellStyle = rowStyleBlue;
  //     sheet.getRangeByIndex(i + 3, 3).cellStyle = rowStyleBlue;
  //     sheet.getRangeByIndex(i + 3, 4).cellStyle = rowStyleBlue;
  //   } else {
  //     sheet.getRangeByIndex(i + 3, 1).cellStyle = rowStyleWhite;
  //     sheet.getRangeByIndex(i + 3, 2).cellStyle = rowStyleWhite;
  //     sheet.getRangeByIndex(i + 3, 3).cellStyle = rowStyleWhite;
  //     sheet.getRangeByIndex(i + 3, 4).cellStyle = rowStyleWhite;
  //   }
  // }

  ///Save
  final List<int> bytes = workbook.saveAsStream();
  workbook.dispose();
  String filename = "trial_balance_$date";
  final String path = (await getApplicationSupportDirectory()).path;
  final String fileName = '$path/$filename.xlsx';
  final File file = File(fileName);
  await file.writeAsBytes(bytes, flush: true);
  await OpenFile.open(fileName);
}
