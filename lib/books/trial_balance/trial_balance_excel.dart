import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

import 'trial_balance_model.dart';

Future<void> createTrialBLExl(List<TrialBalance> data) async {
  String date = DateFormat('dd_MM_yyyy').format(DateTime.now());
  List columnHeader = ['Particulars', 'Debit', 'Credit'];

  final Workbook workbook = Workbook();
  final Worksheet sheet = workbook.worksheets[0];
  Style headingStyle = workbook.styles.add('style');
  Style columnHeadStyle = workbook.styles.add('hcstyle');
  Style amountStyle = workbook.styles.add('amstyle');
  Style rowStyleBlue = workbook.styles.add('rowstyleblue');
  Style rowStyleWhite = workbook.styles.add('rowstylewhite');

  headingStyle.vAlign = VAlignType.center;
  headingStyle.hAlign = HAlignType.center;
  headingStyle.fontSize = 13;
  columnHeadStyle.backColorRgb = const Color.fromRGBO(0, 117, 221, 1);
  columnHeadStyle.hAlign = HAlignType.center;
  columnHeadStyle.fontColor = '#ffffff';
  amountStyle.hAlign = HAlignType.right;

  rowStyleBlue.backColorRgb = const Color.fromRGBO(227, 242, 253, 1);
  rowStyleWhite.backColorRgb = const Color.fromRGBO(254, 254, 254, 1);
  sheet.getRangeByName('A1').columnWidth = 35;
  sheet.getRangeByName('A1').rowHeight = 40;
  sheet.getRangeByName('B1').columnWidth = 12;
  sheet.getRangeByName('C1').columnWidth = 12;
  sheet.getRangeByName('A1:C1').merge();
  sheet.getRangeByName('A1:C1').cellStyle = headingStyle;
  //-------------------HEADING------------
  sheet.getRangeByName('A1').setText('Trial Balance as on $date');

  for (int i = 1; i <= 3; i++) {
    sheet.getRangeByIndex(2, i).setText(columnHeader[i - 1]);
    sheet.getRangeByIndex(2, i).cellStyle = columnHeadStyle;
  }

  for (int i = 0; i < data.length; i++) {
    sheet.getRangeByIndex(i + 3, 1).setText(data[i].ledgerName);

    sheet.getRangeByIndex(i + 3, 2).value =
        data[i].totalCredit < data[i].totalDebit
            ? data[i].balance.toString()
            : '';
    sheet.getRangeByIndex(i + 3, 3).value =
        data[i].totalCredit > data[i].totalDebit
            ? data[i].balance.toString()
            : '';
    sheet.getRangeByIndex(i + 3, 2).cellStyle = amountStyle;
    sheet.getRangeByIndex(i + 3, 3).cellStyle = amountStyle;

    //
    if (i.isEven) {
      sheet.getRangeByIndex(i + 3, 1).cellStyle = rowStyleBlue;
      sheet.getRangeByIndex(i + 3, 2).cellStyle = rowStyleBlue;
      sheet.getRangeByIndex(i + 3, 3).cellStyle = rowStyleBlue;
    } else {
      sheet.getRangeByIndex(i + 3, 1).cellStyle = rowStyleWhite;
      sheet.getRangeByIndex(i + 3, 2).cellStyle = rowStyleWhite;
      sheet.getRangeByIndex(i + 3, 3).cellStyle = rowStyleWhite;
    }
  }
  //  For total calculation
  int _finalCreditTotal = 0;
  int _finalDebitTotal = 0;
  for (var element in data) {
    if (element.totalCredit > element.totalDebit) {
      _finalCreditTotal += element.balance;
    } else if (element.totalCredit < element.totalDebit) {
      _finalDebitTotal += element.balance;
    }
  }

  sheet.getRangeByIndex(data.length + 4, 1).setText('Total');
  sheet
      .getRangeByIndex(data.length + 4, 2)
      .setText(_finalDebitTotal.toString());
  sheet
      .getRangeByIndex(data.length + 4, 3)
      .setText(_finalCreditTotal.toString());

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
