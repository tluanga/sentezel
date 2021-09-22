import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/books/trading_account/trading_ac_excel.dart';
import 'package:sentezel/books/trading_account/trading_account_controller.dart';
import 'package:sentezel/books/widgets/report_top_bar_widget.dart';
import 'trading_account_model.dart';
import 'trading_account_pdf.dart';

class TradingAccountReportScreen extends HookConsumerWidget {
  const TradingAccountReportScreen({Key? key}) : super(key: key);

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
                      return createPdf(data: data);
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
