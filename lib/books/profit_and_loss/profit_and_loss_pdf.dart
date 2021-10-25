import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sentezel/common/helpers/currrency_seperator_string_formatter_helper.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import 'profit_and_loss_model.dart';

Future<void> createPdf({required List<ProfitAndLoss> data}) async {
  var document = PdfDocument();

  document.pageSettings.size = PdfPageSize.a4;

  //Create a PDF page template and add header content.
  final PdfPageTemplateElement headerTemplate =
      PdfPageTemplateElement(const Rect.fromLTWH(0, 0, 515, 50));
  //Draw text in the header.
  String date = DateFormat('dd/MM/yyyy').format(DateTime.now());
  headerTemplate.graphics.drawString(
      'Profit and Loss Account for the year ending $date', // Give a date here
      PdfStandardFont(PdfFontFamily.helvetica, 15),
      bounds: const Rect.fromLTWH(80, 0, 500, 20));

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
  header.cells[0].value = 'Particulars';
  header.cells[1].value = 'Amount';
  header.cells[2].value = 'Particulars';
  header.cells[3].value = 'Amount';
  // for (int i = 1; i <= expenses.length; i++) {
  //   header.cells[i].value = expenses[i].creditSideLedgerName;
  // }
  // header.cells[0].value = 'Employee ID';
  // header.cells[1].value = 'Employee Name';
  // header.cells[2].value = 'Salary';

  //Add rows to grid

  PdfGridRow row = grid.rows.add();
  row.cells[0].value = 'To Gross Profit transaferred to P&L a/c';
  row.cells[1].value = data[0].grossProfit.toString();
  row.cells[2].value = 'To Gross Loss transaferred to P&L a/c';
  row.cells[3].value = data[0].grossLoss.toString();

  for (int i = 0; i < data[0].indirectExpense.length; i++) {
    PdfGridRow row = grid.rows.add();
    row.cells[0].value = data[0].indirectExpense[i].ledgerName;
    row.cells[1].value = currencySeperatorStringFormatterHelperWithoutSymbol(
        (data[0].indirectExpense[i].totalCredit -
                data[0].indirectExpense[i].totalDebit)
            .abs());
  }
  for (int i = 0; i < data[0].indirectIncome.length; i++) {
    PdfGridRow row = grid.rows.add();
    row.cells[2].value = data[0].indirectIncome[i].ledgerName;
    row.cells[3].value = currencySeperatorStringFormatterHelperWithoutSymbol(
        (data[0].indirectIncome[i].totalCredit -
                data[0].indirectIncome[i].totalDebit)
            .abs());
  }

  row = grid.rows.add();
  row.cells[0].value = 'To Net Profit Transferred to Capital ac';
  row.cells[1].value = data[0].netProfit.toString();
  row.cells[2].value = 'To Net Loss Transferred to Capital ac';
  row.cells[3].value = data[0].netLoss.toString();

  row = grid.rows.add();
  row.cells[0].value = 'Total';
  row.cells[1].value = data[0].finalExpenseTotal.toString();
  row.cells[2].value = 'Total';
  row.cells[3].value = data[0].finalIncomeTotal.toString();

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
  String filePath = "$documentPath/profit_and_loss_$now.pdf";
  File file = File(filePath);

  file.writeAsBytesSync(bytes, flush: true);
  await OpenFile.open(filePath);
}
