import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sentezel/common/helpers/currrency_seperator_string_formatter_helper.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'trading_account_model.dart';

Future<void> createPdf({required List<TradingAccount> data}) async {
  var document = PdfDocument();
  document.pageSettings.size = PdfPageSize.a4; // make pdf size to A4

  //Create a PDF page template and add header content.
  final PdfPageTemplateElement headerTemplate =
      PdfPageTemplateElement(const Rect.fromLTWH(0, 0, 515, 50));
  //Draw text in the header.
  String date = DateFormat('dd/MM/yyyy').format(DateTime.now());
  headerTemplate.graphics.drawString(
      'Trading Account for the year ending $date',
      PdfStandardFont(PdfFontFamily.helvetica, 15),
      bounds: const Rect.fromLTWH(105, 15, 500, 20));

  document.template.top = headerTemplate;
  //Create a PdfGrid class
  PdfGrid grid = PdfGrid();

  //Add the columns to the grid
  grid.columns.add(count: 4);

  //Add header to the grid
  final PdfGridRow headerRow = grid.headers.add(1)[0];
  //Add the rows to the grid
  headerRow.style.backgroundBrush = PdfSolidBrush(PdfColor(68, 114, 196));
  headerRow.style.textBrush = PdfBrushes.white;
  PdfGridRow header = grid.headers[0];
  for (int i = 0; i < 4; i++) {
    header.cells[i].stringFormat = PdfStringFormat(
      alignment: PdfTextAlignment.center,
    );
  }

  // Particulars and amount heading
  header.cells[0].value = 'Particulars';
  header.cells[1].value = 'Amount';
  header.cells[2].value = 'Particulars';
  header.cells[3].value = 'Amount';

  // List of expense and income
  int length;
  if (data[0].directExpense.length > data[0].directIncome.length) {
    length = data[0].directExpense.length;
  } else if (data[0].directIncome.length > data[0].directExpense.length) {
    length = data[0].directIncome.length;
  } else {
    length = data[0].directExpense.length;
  }

  // print('outside for loop, expense length is ${expenses.length}');
  // print('outside for loop, income length is ${income.length}');

  for (int i = 0; i < length; i++) {
    PdfGridRow row = grid.rows.add();
    //---------Expense---------
    if (data[0].directExpense.length > i) {
      row.cells[1].stringFormat.alignment = PdfTextAlignment.center;
      row.cells[0].value = data[0].directExpense[i].ledgerName;
      row.cells[1].value = (data[0].directExpense[i].totalCredit -
              data[0].directExpense[i].totalCredit)
          .abs()
          .toString();
    }
    //-------income
    if (data[0].directIncome.length > i) {
      row.cells[3].stringFormat.alignment = PdfTextAlignment.center;
      row.cells[2].value = data[0].directIncome[i].ledgerName;
      row.cells[3].value = (data[0].directIncome[i].totalCredit -
              data[0].directIncome[i].totalCredit)
          .abs()
          .toString();
    }
  }
  // for (int i = 0; i < income.length; i++) {
  //   PdfGridRow row = grid.rows.add();

  // }

  // gross profit and gross loss
  PdfGridRow row = grid.rows.add();
  row.cells[1].stringFormat.alignment = PdfTextAlignment.center;
  row.cells[3].stringFormat.alignment = PdfTextAlignment.center;
  row.cells[0].value = 'To Gross Profit transaferred to P&L a/c';
  row.cells[1].value =
      currencySeperatorStringFormatterHelperWithoutSymbol(data[0].grossProfit);
  row.cells[2].value = 'To Gross Loss transaferred to P&L a/c';
  row.cells[3].value =
      currencySeperatorStringFormatterHelperWithoutSymbol(data[0].grossLoss);

  // Total still needs to be fixed
  row = grid.rows.add();
  row.cells[1].stringFormat.alignment = PdfTextAlignment.center;
  row.cells[3].stringFormat.alignment = PdfTextAlignment.center;
  row.cells[0].value = 'Total';
  row.cells[1].value = currencySeperatorStringFormatterHelperWithoutSymbol(
      data[0].finalExpenseTotal);
  row.cells[2].value = 'Total';
  row.cells[3].value = currencySeperatorStringFormatterHelperWithoutSymbol(
      data[0].finalIncomeTotal);

  //Set the grid style
  grid.applyBuiltInStyle(PdfGridBuiltInStyle.listTable4Accent5);
  grid.style = PdfGridStyle(
      cellPadding: PdfPaddings(left: 2, right: 3, top: 4, bottom: 5),
      // backgroundBrush: PdfSolidBrush(PdfColor(68, 114, 196)),
      // textBrush: PdfBrushes.white,
      font: PdfStandardFont(PdfFontFamily.timesRoman, 10));

  //Draw the grid
  grid.draw(
      page: document.pages.add(), bounds: const Rect.fromLTWH(0, 0, 0, 0));

  // Add page and draw text to the page.
  // page.graphics.drawString(
  //     'Hello World!', PdfStandardFont(PdfFontFamily.helvetica, 18),
  //     brush: PdfSolidBrush(PdfColor(0, 0, 0)),
  //     bounds: Rect.fromLTWH(0, 0, 500, 30));
  //Save the document
  var bytes = document.save();
  // Dispose the document
  document.dispose();

  Directory documentDirectory = await getApplicationDocumentsDirectory();

  String documentPath = documentDirectory.path;
  String now = DateFormat('dd_MM_yyyy').format(DateTime.now());
  String filePath = "$documentPath/trading_account_$now";

  File file = File(filePath);

  file.writeAsBytesSync(bytes, flush: true);

  await OpenFile.open(filePath);
}
