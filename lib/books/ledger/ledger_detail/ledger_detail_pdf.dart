import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sentezel/books/ledger/ledger_model.dart';
import 'package:sentezel/common/enums/debit_or_credit_enum.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

Future<void> createPdf({required LedgerReport data}) async {
  String name = data.name;
  // print('Ledger name is ${widget.ledger.name}');
  //Create a PDF document.
  var document = PdfDocument();

  document.pageSettings.size = PdfPageSize.a4;

  final PdfPageTemplateElement headerTemplate =
      PdfPageTemplateElement(const Rect.fromLTWH(0, 0, 515, 50));
  //Draw text in the header.
  headerTemplate.graphics.drawString(
    '$name Account', PdfStandardFont(PdfFontFamily.helvetica, 15),
    // bounds: const Rect.fromLTWH(200, 15, 500, 20)
  );
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
  header.cells[2].style.stringFormat =
      PdfStringFormat(alignment: PdfTextAlignment.center);
  header.cells[1].style.stringFormat =
      PdfStringFormat(alignment: PdfTextAlignment.center);
  header.cells[0].value = 'Particulars';
  header.cells[1].value = 'Debit';
  header.cells[2].value = 'Credit';

  //Add rows to grid
  for (int i = 0; i < data.ledgerTransaction!.length; i++) {
    PdfGridRow row = grid.rows.add();
    row.cells[1].style.stringFormat =
        PdfStringFormat(alignment: PdfTextAlignment.center);
    row.cells[2].style.stringFormat =
        PdfStringFormat(alignment: PdfTextAlignment.center);
    row.cells[0].value = data.ledgerTransaction![i].transaction!.particular;
    row.cells[1].value =
        data.ledgerTransaction![i].debitOrCredit == DebitOrCredit.debit
            ? data.ledgerTransaction![i].amount.toString()
            : '';
    row.cells[2].value =
        data.ledgerTransaction![i].debitOrCredit == DebitOrCredit.credit
            ? data.ledgerTransaction![i].amount.toString()
            : '';
  }

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

  //Add page and draw text to the page.
  // document.pages.add().graphics.drawString(
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
  String filePath = "$documentPath/${name}_account_$now";

  File file = File(filePath);

  file.writeAsBytesSync(bytes, flush: true);

  await OpenFile.open(filePath);
}
