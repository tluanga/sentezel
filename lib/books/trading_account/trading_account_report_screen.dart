import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sentezel/books/trading_account/trading_ac_excel.dart';
import 'package:sentezel/books/trading_account/trading_account_controller.dart';

import 'package:sentezel/books/widgets/report_top_bar_widget.dart';
import 'package:sentezel/common/helpers/currrency_seperator_string_formatter_helper.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'trading_account_model.dart';

class TradingAccountReportScreen extends HookConsumerWidget {
  const TradingAccountReportScreen({Key? key}) : super(key: key);

  Future<void> _createPdf({required List<TradingAccount> data}) async {
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
        print('the value of i in expense $i');
        row.cells[1].stringFormat.alignment = PdfTextAlignment.center;
        row.cells[0].value = data[0].directExpense[i].ledgerName;
        row.cells[1].value = (data[0].directExpense[i].totalCredit -
                data[0].directExpense[i].totalCredit)
            .abs()
            .toString();
      }
      //-------income
      if (data[0].directIncome.length > i) {
        print('the value of i in income $i');
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
    row.cells[1].value = currencySeperatorStringFormatterHelperWithoutSymbol(
        data[0].grossProfit);
    row.cells[2].value = 'To Gross Loss transaferred to P&L a/c';
    row.cells[3].value =
        currencySeperatorStringFormatterHelperWithoutSymbol(data[0].grossLoss);

    // Total still needs to be fixed
    row = grid.rows.add();
    row.cells[1].stringFormat.alignment = PdfTextAlignment.center;
    row.cells[3].stringFormat.alignment = PdfTextAlignment.center;
    row.cells[0].value = 'Total';
    row.cells[1].value = currencySeperatorStringFormatterHelperWithoutSymbol(0);
    row.cells[2].value = 'Total';
    row.cells[3].value = currencySeperatorStringFormatterHelperWithoutSymbol(0);

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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(tradingAccountControllerProvider);
    useEffect(() {
      ref.watch(tradingAccountControllerProvider.notifier).loadData();
    }, []);
    return Material(
      child: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              ReportTopBarWidget(
                  title: 'Trading Account',
                  onGenerateExcel: () {
                    state.when(data: (data) {
                      return createTradingAcExl(data);
                    }, loading: () {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }, error: (e, stack) {
                      throw (e.toString());
                    });
                  },
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
                  onClose: () {
                    Navigator.pop(context);
                  }),
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
                  child: TabBarView(children: [
                // Expense Side
                state.when(data: (data) {
                  return _expenselist(context: context, data: data, ref: ref);
                }, loading: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }, error: (error, stack) {
                  return const Center(
                    child: Text('error'),
                  );
                }),
                //  income side
                state.when(data: (data) {
                  return _incomeList(context: context, data: data, ref: ref);
                }, loading: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }, error: (error, stack) {
                  return const Center(
                    child: Text('error'),
                  );
                })
              ])),
            ],
          ),
        ),
      ),
    );
  }

  _expenselist(
      {required BuildContext context,
      required List<TradingAccount> data,
      required WidgetRef ref}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: data[0].directExpense.length,
                itemBuilder: (context, index) {
                  return _expenselistItem(
                      context: context,
                      item: data[0].directExpense[index],
                      ref: ref);
                },
              ),
            ),
            data[0].grossProfit != 0
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Gross Profit'),
                      Text(data[0].grossProfit.toString())
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
      required DirectExpense item,
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
      required List<TradingAccount> data,
      required WidgetRef ref}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: data[0].directIncome.length,
                itemBuilder: (context, index) {
                  return _incomelistItem(
                      context: context,
                      item: data[0].directIncome[index],
                      ref: ref);
                },
              ),
            ),
            data[0].grossLoss != 0
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Gross Loss'),
                      Text(data[0].grossLoss.toString())
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
      required DirectIncome item,
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
