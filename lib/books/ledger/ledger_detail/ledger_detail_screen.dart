import 'dart:io';

import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sentezel/analytics/ui/widgets/analytics_time_frame_selection/analytics_time_frame_selection_widget.dart';
import 'package:sentezel/books/ledger/ledger_detail/ledger_detail_controller.dart';
import 'package:sentezel/books/ledger/ledger_transaction/ledger_transaction_detail_bottom_sheet.dart';
import 'package:sentezel/books/ledger/ledger_transaction/ledger_transaction_model.dart';
import 'package:sentezel/books/ledger/ledger_transaction/transaction_delete_confirm_bottomSheet.dart';
import 'package:sentezel/common/helpers/currrency_seperator_string_formatter_helper.dart';
import 'package:sentezel/common/ui/widget/excel_export_button_widget.dart';
import 'package:sentezel/common/ui/widget/pdf_export_button_widget.dart';

import 'package:sentezel/books/ledger/ledger_model.dart';
import 'package:sentezel/common/enums/debit_or_credit_enum.dart';
import 'package:sentezel/common/ui/widget/time_frame_selection/element/day_selection_widget.dart';

import 'package:sentezel/common/ui/widget/time_frame_selection/time_frame_selection_widget.dart';

import 'package:sentezel/common/ui/widget/top_bar_widget.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class LedgerDetailScreen extends HookConsumerWidget {
  const LedgerDetailScreen({
    Key? key,
  }) : super(key: key);

  Future<void> _createPdf({required LedgerReport data}) async {
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
    // for (int i = 1; i <= pdfList.length; i++) {
    //   header.cells[i].value = pdfList[i].creditSideLedgerName;
    // }
    // header.cells[0].value = 'Employee ID';
    // header.cells[1].value = 'Employee Name';
    // header.cells[2].value = 'Salary';
    print('current test ');
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
    // PdfGridRow row = grid.rows.add();
    // row.cells[0].value = 'E01';
    // row.cells[1].value = 'Clay';
    // // row.cells[2].value = '\$10,000';

    // row = grid.rows.add();
    // row.cells[0].value = 'E02';
    // row.cells[1].value = 'Simon';
    // row.cells[2].value = '\$12,000';

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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(ledgerDetailControllerProvider);

    return Material(
      child: SafeArea(
        child: Column(
          children: [
            TopBarWidget(
              title: 'Ledger-${state.name}',
              onClose: () {
                Navigator.pop(context);
              },
            ),
            DaySelectionWidget(
              onDateSelected: (startDate, endDate) {
                ref
                    .read(ledgerDetailControllerProvider.notifier)
                    .loadData(id: state.ledgerId);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            _listHeader(context),
            _list(context: context, ledgerReportData: state),
            _report(
              data: state,
              context: context,
              onPdfExport: () {
                _createPdf(data: state);
              },
              onExcelExport: () {},
            ),
          ],
        ),
      ),
    );
  }

  _listHeader(context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
            width: size.width * 0.50,
            padding: const EdgeInsets.all(15),
            color: Colors.cyan[50],
            child: const Text(
              'Particulars',
              style: TextStyle(fontWeight: FontWeight.w500),
            )),
        const VerticalDivider(
          width: 2,
        ),
        Container(
            width: size.width * 0.24,
            padding: const EdgeInsets.all(15),
            color: Colors.cyan[50],
            child: const Text(
              'Debit',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w500),
            )),
        const VerticalDivider(
          width: 2,
        ),
        Container(
          width: size.width * 0.24,
          padding: const EdgeInsets.all(15),
          color: Colors.cyan[50],
          child: const Text(
            'Credit',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }

  _list(
      {required BuildContext context, required LedgerReport ledgerReportData}) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.575,
      child: ListView.builder(
        itemCount: ledgerReportData.ledgerTransaction != null
            ? ledgerReportData.ledgerTransaction!.length
            : 0,
        itemBuilder: (context, index) {
          return _listItem(
            context,
            ledgerReportData.ledgerTransaction![index],
          );
        },
      ),
    );
  }

//       child:

  _listItem(BuildContext context, LedgerTransaction data) {
    Size size = MediaQuery.of(context).size;
    return Slidable(
      actionPane: const SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      secondaryActions: [
        IconSlideAction(
          caption: 'View Detail',
          color: Colors.blue,
          icon: Icons.wrap_text,
          onTap: () => {
            showModalBottomSheet(
              context: context,
              builder: (context) => LedgerTransactionDetailBottomSheet(
                ledgerTransaction: data,
              ),
            )
          },
        ),
        // IconSlideAction(
        //   caption: 'Edit',
        //   color: Colors.purple,
        //   icon: Icons.edit,
        //   onTap: () => {

        //     showModalBottomSheet(
        //       context: context,
        //       builder: (context) => LedgerTransactionDetailBottomSheet(
        //         ledgerTransaction: data,
        //       ),
        //     )
        //   },
        // ),
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red.shade300,
          icon: Icons.delete,
          onTap: () => {
            showModalBottomSheet(
              context: context,
              builder: (context) => TransactionDeleteConfirmBottomSheet(
                transactionId: data.transaction!.id!,
              ),
            )
          },
        )
      ],
      child: Row(
        children: [
          Column(
            children: [
              Container(
                  height: size.height * 0.05,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        width: size.width * 0.50,
                        child: Text(
                          data.transaction!.particular,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: size.width * 0.24,
                        child: Text(
                          data.debitOrCredit == DebitOrCredit.debit
                              ? data.amount.toString()
                              : '',
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: size.width * 0.24,
                        child: Text(
                          data.debitOrCredit == DebitOrCredit.credit
                              ? currencySeperatorStringFormatterHelper(
                                  data.amount)
                              : '',
                        ),
                      ),
                    ],
                  )),
              const Divider(),
            ],
          )
        ],
      ),
    );
  }

  _report({
    required LedgerReport data,
    required BuildContext context,
    required Function onPdfExport,
    required Function onExcelExport,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
      ),
      // this is mock data for total
      height: MediaQuery.of(context).size.height * 0.1,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.30,
                decoration: BoxDecoration(color: Colors.green.shade200),
                child: Row(
                  children: [
                    const Text('Debit:'),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                        child: Text(
                          currencySeperatorStringFormatterHelper(
                              data.debitAmount),
                        ),
                        alignment: Alignment.centerRight),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.30,
                decoration: BoxDecoration(color: Colors.red.shade200),
                child: Row(
                  children: [
                    const Text('Credit:'),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                        child: Text(
                          currencySeperatorStringFormatterHelper(
                              data.creditAmount),
                        ),
                        alignment: Alignment.centerRight),
                  ],
                ),
              ),
              Row(
                children: [
                  const Text('Bal:'),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: 20,
                      decoration: BoxDecoration(
                        color: (data.debitAmount - data.creditAmount >= 0)
                            ? Colors.green.shade200
                            : Colors.red.shade200,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          currencySeperatorStringFormatterHelper(
                              data.debitAmount - data.creditAmount),
                          // (model.debit - model.credit).toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      alignment: Alignment.centerRight),
                ],
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    onPdfExport();
                  },
                  child: const PDFExportButton(),
                ),
                GestureDetector(
                  onTap: () {
                    onExcelExport();
                  },
                  child: const ExcelExportButton(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
