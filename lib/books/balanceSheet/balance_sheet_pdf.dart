import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sentezel/books/balanceSheet/balance_sheet_model.dart';
import 'package:sentezel/common/helpers/currrency_seperator_string_formatter_helper.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

Future<void> createPdf({required List<BalanceSheet> data}) async {
  var document = PdfDocument();

  String date = DateFormat('dd/MM/yyyy').format(DateTime.now());

  document.pageSettings.size = PdfPageSize.a4;

  //Create a PDF page template and add header content.
  final PdfPageTemplateElement headerTemplate =
      PdfPageTemplateElement(const Rect.fromLTWH(0, 0, 515, 50));
  //Draw text in the header.
  headerTemplate.graphics.drawString(
      'Balance Sheet for the year ending $date', // Give the date here
      PdfStandardFont(PdfFontFamily.helvetica, 15),
      bounds: const Rect.fromLTWH(100, 0, 0, 0));

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
  header.cells[1].stringFormat.alignment = PdfTextAlignment.center;
  header.cells[3].stringFormat.alignment = PdfTextAlignment.center;
  header.cells[0].value = 'Particulars';
  header.cells[1].value = 'Amount';
  header.cells[2].value = 'Particulars';
  header.cells[3].value = 'Amount';

  //Add rows to grid

  PdfGridRow row = grid.rows.add();
  row.cells[1].stringFormat.alignment = PdfTextAlignment.center;
  row.cells[3].stringFormat.alignment = PdfTextAlignment.center;
  row.cells[0].value = 'Creditors';
  row.cells[1].value =
      currencySeperatorStringFormatterHelperWithoutSymbol(data[0].creditors);
  row.cells[2].value = 'Cash in hand';
  row.cells[3].value =
      currencySeperatorStringFormatterHelperWithoutSymbol(data[0].cash);

  row = grid.rows.add();
  row.cells[1].stringFormat.alignment = PdfTextAlignment.center;
  row.cells[3].stringFormat.alignment = PdfTextAlignment.center;
  row.cells[0].value = 'Capital';
  row.cells[1].value =
      currencySeperatorStringFormatterHelperWithoutSymbol(data[0].capital);
  row.cells[2].value = 'Cash at Bank';
  row.cells[3].value =
      currencySeperatorStringFormatterHelperWithoutSymbol(data[0].bank);

  // for (int i = 0; i < expenses.length; i++) {
  //   PdfGridRow row = grid.rows.add();
  //   row.cells[0].value = expenses[i].name;
  //   row.cells[1].value = expenses[i].amount.toString();
  // }
  // for (int i = 0; i < income.length; i++) {
  //   PdfGridRow row = grid.rows.add();
  //   row.cells[2].value = income[i].name;
  //   row.cells[3].value = income[i].amount.toString();
  // }

  row = grid.rows.add();
  row.cells[1].stringFormat.alignment = PdfTextAlignment.center;
  row.cells[3].stringFormat.alignment = PdfTextAlignment.center;
  row.cells[0].value = 'Add : Net Profit';
  row.cells[1].value =
      currencySeperatorStringFormatterHelperWithoutSymbol(data[0].netProfit);
  row.cells[2].value = 'Debtors';
  row.cells[3].value =
      currencySeperatorStringFormatterHelperWithoutSymbol(data[0].debtors);

  row = grid.rows.add();
  row.cells[1].stringFormat.alignment = PdfTextAlignment.center;
  row.cells[0].value = 'Less : Net Loss';
  row.cells[1].value = data[0].netLoss != 0
      ? "- ${currencySeperatorStringFormatterHelperWithoutSymbol(data[0].netLoss)}"
      : data[0].netLoss.toString();

  for (int i = 0; i < data[0].asset.length; i++) {
    row.cells[3].stringFormat.alignment = PdfTextAlignment.center;
    row.cells[2].value = data[0].asset[i].name;
    row.cells[3].value = currencySeperatorStringFormatterHelperWithoutSymbol(
        data[0].asset[i].amount);
  }

  row = grid.rows.add();
  row.cells[1].stringFormat.alignment = PdfTextAlignment.center;
  row.cells[3].stringFormat.alignment = PdfTextAlignment.center;
  row.cells[0].value = 'Total';
  row.cells[1].value = currencySeperatorStringFormatterHelperWithoutSymbol(
      data[0].totalLiabilities);
  row.cells[2].value = 'Total';
  row.cells[3].value =
      currencySeperatorStringFormatterHelperWithoutSymbol(data[0].totalAssets);

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
  String filePath = "$documentPath/balance_Sheet_$now";

  File file = File(filePath);

  file.writeAsBytesSync(bytes, flush: true);

  await OpenFile.open(filePath);
}
