import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sentezel/books/ledger/ledger_model.dart';
import 'package:sentezel/books/profit_and_loss/profit_and_loss_controller.dart';
import 'package:sentezel/books/profit_and_loss/profit_and_loss_model.dart';

import 'package:sentezel/books/widgets/report_top_bar_widget.dart';
import 'package:sentezel/common/helpers/currrency_seperator_string_formatter_helper.dart';
import 'package:sentezel/common/ui/widget/excel_export_button_widget.dart';
import 'package:sentezel/common/ui/widget/pdf_export_button_widget.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class ProfitAndLossReportScreen extends HookConsumerWidget {
  const ProfitAndLossReportScreen({Key? key}) : super(key: key);

  Future<void> _createPdf({required List<ProfitAndLoss> data}) async {
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
    print('current test ');

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
    row.cells[1].value = 0.toString();
    row.cells[2].value = 'Total';
    row.cells[3].value = 0.toString();

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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profitAndLossControllerProvider);
    useEffect(() {
      ref.watch(profitAndLossControllerProvider.notifier).loadData();
    }, []);
    return Material(
      child: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              ReportTopBarWidget(
                  title: 'Profit & Loss',
                  onGenerateExcel: () {},
                  onGeneratePdf: () {
                    state.when(data: (data) {
                      return _createPdf(data: data);
                    }, loading: () {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }, error: (e, stack) {
                      throw (e.toString());
                    });
                  },
                  onClose: () {}),
              const TabBar(tabs: [
                Text(
                  'Expenses',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                Text(
                  'Income',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                )
              ]),
              Expanded(
                child: TabBarView(
                  children: [
                    // Expenses Side
                    state.when(data: (data) {
                      return _expenselist(
                          context: context, data: data, ref: ref);
                    }, loading: () {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }, error: (error, stack) {
                      return const Center(
                        child: Text('error'),
                      );
                    }),
                    // Income side
                    state.when(data: (data) {
                      return _incomeList(
                          context: context, data: data, ref: ref);
                    }, loading: () {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }, error: (error, stack) {
                      return const Center(
                        child: Text('error'),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _expenselist(
      {required BuildContext context,
      required List<ProfitAndLoss> data,
      required WidgetRef ref}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            data[0].grossLoss != 0
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Gross Loss'),
                      Text(data[0].grossLoss.toString())
                    ],
                  )
                : Container(),
            Expanded(
              child: ListView.builder(
                itemCount: data[0].indirectExpense.length,
                itemBuilder: (context, index) {
                  return _expenselistItem(
                      context: context,
                      item: data[0].indirectExpense[index],
                      ref: ref);
                },
              ),
            ),
            data[0].netProfit != 0
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Net Profit'),
                      Text(data[0].netProfit.toString())
                    ],
                  )
                : Container(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total'),
                Text(data[0].finalExpenseTotal.toString())
              ],
            )
          ],
        ),
      ),
    );
  }

  _expenselistItem(
      {required BuildContext context,
      required IndirectExpense item,
      required WidgetRef ref}) {
    int balance = 0;
    if (item.totalCredit > item.totalDebit) {
      balance = item.totalCredit - item.totalDebit;
    } else if (item.totalCredit < item.totalDebit) {
      balance = item.totalDebit - item.totalCredit;
    } else if (item.totalCredit == item.totalDebit) {
      balance = 0;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(item.ledgerName),
        const SizedBox(
          width: 20,
        ),
        Text(balance.toString()),
      ],
    );
  }

  _incomeList(
      {required BuildContext context,
      required List<ProfitAndLoss> data,
      required WidgetRef ref}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            data[0].grossProfit != 0
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Gross Profit'),
                      Text(data[0].grossProfit.toString())
                    ],
                  )
                : Container(),
            Expanded(
              child: ListView.builder(
                itemCount: data[0].indirectIncome.length,
                itemBuilder: (context, index) {
                  return _incomelistItem(
                      context: context,
                      item: data[0].indirectIncome[index],
                      ref: ref);
                },
              ),
            ),
            data[0].netLoss != 0
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Net Loss'),
                      Text(data[0].netLoss.toString())
                    ],
                  )
                : Container(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total'),
                Text(data[0].finalIncomeTotal.toString())
              ],
            )
          ],
        ),
      ),
    );
  }

  _incomelistItem(
      {required BuildContext context,
      required IndirectIncome item,
      required WidgetRef ref}) {
    int balance = 0;
    if (item.totalCredit > item.totalDebit) {
      balance = item.totalCredit - item.totalDebit;
    } else if (item.totalCredit < item.totalDebit) {
      balance = item.totalDebit - item.totalCredit;
    } else if (item.totalCredit == item.totalDebit) {
      balance = 0;
    }
    return Row(
      children: [
        Text(item.ledgerName),
        const SizedBox(
          width: 20,
        ),
        Text(balance.toString()),
      ],
    );
  }
}
