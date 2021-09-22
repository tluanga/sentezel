import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sentezel/books/balanceSheet/balance_sheet_model.dart';
import 'package:sentezel/common/helpers/currrency_seperator_string_formatter_helper.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

Future<void> createBLAcExl(List<BalanceSheet> data) async {
  String date = DateFormat('dd_MM_yyyy').format(DateTime.now());
  List columnHeader = ['Liabilities', 'Amount', 'Assets', 'Amount'];

  final Workbook workbook = Workbook();
  final Worksheet sheet = workbook.worksheets[0];
  Style headingStyle = workbook.styles.add('style');
  Style columnHeadStyle = workbook.styles.add('hcstyle');

  Style rowStyleBlue = workbook.styles.add('rowstyleblue');
  Style rowStyleWhite = workbook.styles.add('rowstylewhite');
  Style netlossStyle = workbook.styles.add("netlossStyle");
  netlossStyle.hAlign = HAlignType.right;
  headingStyle.vAlign = VAlignType.center;
  headingStyle.hAlign = HAlignType.center;
  headingStyle.fontSize = 13;
  columnHeadStyle.hAlign = HAlignType.center;
  columnHeadStyle.backColorRgb = const Color.fromRGBO(0, 117, 221, 1);
  columnHeadStyle.fontColor = '#ffffff';
  rowStyleBlue.backColorRgb = const Color.fromRGBO(227, 242, 253, 1);
  rowStyleWhite.backColorRgb = const Color.fromRGBO(254, 254, 254, 1);

  sheet.getRangeByName('A1').rowHeight = 43;
  sheet.getRangeByName('A1').columnWidth = 38;
  sheet.getRangeByName('B1').columnWidth = 15;
  sheet.getRangeByName('C1').columnWidth = 38;
  sheet.getRangeByName('D1').columnWidth = 15;
  sheet.getRangeByName('A1:D1').merge();
  sheet.getRangeByName('A1:D1').cellStyle = headingStyle;
  //-------------------HEADING------------
  sheet.getRangeByName('A1').setText("Balance Sheet for the year ending $date");
  //---Column Head implement
  for (int i = 1; i <= columnHeader.length; i++) {
    sheet.getRangeByIndex(2, i).setText(columnHeader[i - 1]);
    sheet.getRangeByIndex(2, i).cellStyle = columnHeadStyle;
  }
  //Add rows to grid
  //row 1
  sheet.getRangeByIndex(3, 1).value = 'Creditors';
  sheet.getRangeByIndex(3, 2).number = double.parse(
      currencySeperatorStringFormatterHelperWithoutSymbol(data[0].creditors));

  sheet.getRangeByIndex(3, 3).value = 'Cash in hand';
  sheet.getRangeByIndex(3, 4).number = double.parse(
      currencySeperatorStringFormatterHelperWithoutSymbol(data[0].cash));
  //row 2
  sheet.getRangeByIndex(4, 1).value = 'Capital';
  sheet.getRangeByIndex(4, 2).number = double.parse(
      currencySeperatorStringFormatterHelperWithoutSymbol(data[0].capital));

  sheet.getRangeByIndex(4, 3).value = 'Cash at Bank';
  sheet.getRangeByIndex(4, 4).number = double.parse(
      currencySeperatorStringFormatterHelperWithoutSymbol(data[0].bank));

  //row 3
  sheet.getRangeByIndex(5, 1).value = 'Add : Net Profit';
  sheet.getRangeByIndex(5, 2).number = double.parse(
      currencySeperatorStringFormatterHelperWithoutSymbol(data[0].netProfit));

  sheet.getRangeByIndex(5, 3).value = 'Debtors';
  sheet.getRangeByIndex(5, 4).number = double.parse(
      currencySeperatorStringFormatterHelperWithoutSymbol(data[0].debtors));

  //row 4
  sheet.getRangeByIndex(6, 1).value = 'Less : Net Loss';
  sheet.getRangeByIndex(6, 2).value = data[0].netLoss != 0
      ? "-" +
          currencySeperatorStringFormatterHelperWithoutSymbol(data[0].netLoss)
      : data[0].netLoss.toString();
  sheet.getRangeByIndex(6, 2).cellStyle = netlossStyle;
// Asset Data
  for (int i = 0; i < data[0].asset.length; i++) {
    sheet.getRangeByIndex(i + 6, 3).value = data[0].asset[i].name;
    sheet.getRangeByIndex(i + 6, 4).number = double.parse(
        currencySeperatorStringFormatterHelperWithoutSymbol(
            data[0].asset[i].amount));
  }
  int dataLength = data[0].asset.length;

  sheet.getRangeByIndex(dataLength + 7, 1).value = 'Total';
  sheet.getRangeByIndex(dataLength + 7, 2).number = double.parse(
      currencySeperatorStringFormatterHelperWithoutSymbol(
          data[0].totalLiabilities));
  sheet.getRangeByIndex(dataLength + 7, 3).value = 'Total';
  sheet.getRangeByIndex(dataLength + 7, 4).value = double.parse(
      currencySeperatorStringFormatterHelperWithoutSymbol(data[0].totalAssets));

  sheet.getRangeByIndex(dataLength + 7, 3).value = 'Total';
  sheet.getRangeByIndex(dataLength + 7, 4).value = double.parse(
      currencySeperatorStringFormatterHelperWithoutSymbol(data[0].totalAssets));

  ///Save
  final List<int> bytes = workbook.saveAsStream();
  workbook.dispose();
  String filename = "balance_sheet_$date";
  final String path = (await getApplicationSupportDirectory()).path;
  final String fileName = '$path/$filename.xlsx';
  final File file = File(fileName);
  await file.writeAsBytes(bytes, flush: true);
  await OpenFile.open(fileName);
}
