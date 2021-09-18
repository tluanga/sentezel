import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/books/ledger/ledger_model.dart';
import 'package:sentezel/books/profit_and_loss/profit_and_loss_controller.dart';
import 'package:sentezel/books/profit_and_loss/profit_and_loss_model.dart';

import 'package:sentezel/books/widgets/report_top_bar_widget.dart';
import 'package:sentezel/common/helpers/currrency_seperator_string_formatter_helper.dart';
import 'package:sentezel/common/ui/widget/excel_export_button_widget.dart';
import 'package:sentezel/common/ui/widget/pdf_export_button_widget.dart';
import 'package:sentezel/common/ui/widget/top_bar_widget.dart';

class ProfitAndLossReportScreen extends HookConsumerWidget {
  const ProfitAndLossReportScreen({Key? key}) : super(key: key);

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
          child: TabBarView(
            children: [
              // expense side
              Column(
                children: [
                  TopBarWidget(
                      title: 'Profit & Loss',
                      onClose: () {
                        Navigator.pop(context);
                      }),
                  // ReportTopBarWidget(
                  //     title: 'Profit & Loss Account',
                  //     onGenerateExcel: () {},
                  //     onGeneratePdf: () {},
                  //     onClose: () {}),
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
                  })
                ],
              ),
              // Income side
              Column(
                children: [
                  ReportTopBarWidget(
                      title: 'Profit & Loss Account',
                      onGenerateExcel: () {},
                      onGeneratePdf: () {},
                      onClose: () {}),
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
                ],
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
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Gross Loss'),
              Text(data[0].grossLoss.toString())
            ],
          ),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Net Profit'),
              Text(data[0].netProfit.toString())
            ],
          ),
          _report(
            context: context,
            data: LedgerReport(
                ledgerId: 1,
                name: '',
                description: '',
                creditAmount: 199,
                debitAmount: 00),
          ),
        ],
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
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Gross Profit'),
              Text(data[0].grossProfit.toString())
            ],
          ),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Net Loss'),
              Text(data[0].netLoss.toString())
            ],
          )
        ],
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

  _report({required LedgerReport data, required BuildContext context}) {
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
                width: MediaQuery.of(context).size.width * 0.25,
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
                width: MediaQuery.of(context).size.width * 0.25,
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
                  const Text('Balance:'),
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
              children: const [
                PDFExportButton(),
                ExcelExportButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
