import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sentezel/common/helpers/currrency_seperator_string_formatter_helper.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import 'trial_balance_model.dart';

Future<void> createPdf({required List<TrialBalance> data}) async {
  var document = PdfDocument();

  document.pageSettings.size = PdfPageSize.a4;

  //Create a PDF page template and add header content.
  String date = DateFormat('dd/MM/yyyy').format(DateTime.now());
  final PdfPageTemplateElement headerTemplate =
      PdfPageTemplateElement(const Rect.fromLTWH(0, 0, 515, 50));
  //Draw text in the header.
  headerTemplate.graphics.drawString(
      'Trial Balance as on $date', PdfStandardFont(PdfFontFamily.helvetica, 15),
      bounds: const Rect.fromLTWH(150, 15, 500, 20));

  document.template.top = headerTemplate;
  //Create a PdfGrid class
  PdfGrid grid = PdfGrid();

  //Add the columns to the grid
  grid.columns.add(count: 3);
  grid.columns[0].width = 300;

  //Add header to the grid
  final PdfGridRow headerRow = grid.headers.add(1)[0];
  //Add the rows to the grid
  headerRow.style.backgroundBrush = PdfSolidBrush(PdfColor(68, 114, 196));
  headerRow.style.textBrush = PdfBrushes.white;
  PdfGridRow header = grid.headers[0];
  header.cells[0].value = 'Particulars';
  header.cells[1].value = 'Debit';
  header.cells[2].value = 'Credit';
  // for (int i = 1; i <= pdfList.length; i++) {
  //   header.cells[i].value = pdfList[i].creditSideLedgerName;
  // }
  // header.cells[0].value = 'Employee ID';
  // header.cells[1].value = 'Employee Name';
  // header.cells[2].value = 'Salary';
  //Add rows to grid
  for (int i = 0; i < data.length; i++) {
    PdfGridRow row = grid.rows.add();
    row.cells[0].value = data[i].ledgerName;
    row.cells[1].value = data[i].totalCredit < data[i].totalDebit
        ? data[i].balance.toString()
        : '';
    row.cells[2].value = data[i].totalCredit > data[i].totalDebit
        ? data[i].balance.toString()
        : '';
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

  PdfGridRow row = grid.rows.add();
  row.cells[0].value = 'Total';
  row.cells[1].value =
      currencySeperatorStringFormatterHelperWithoutSymbol(_finalDebitTotal);
  row.cells[2].value =
      currencySeperatorStringFormatterHelperWithoutSymbol(_finalCreditTotal);

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
  String filePath = "$documentPath/trial_balance_$now";

  File file = File(filePath);

  file.writeAsBytesSync(bytes, flush: true);

  await OpenFile.open(filePath);
}
