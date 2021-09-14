import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/books/profitAndLossReport/profitAndLoss_controller.dart';
import 'package:sentezel/books/profitAndLossReport/profitAndLoss_model.dart';
import 'package:sentezel/books/widgets/reportTopBar_widget.dart';

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
                  ReportTopBarWidget(
                      title: 'Profit & Loss Account',
                      onGenerateExcel: () {},
                      onGeneratePdf: () {},
                      onClose: () {}),
                  state.when(data: (data) {
                    return _expenselist(context: context, data: data, ref: ref);
                  }, loading: () {
                    print('inside loading');
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }, error: (error, stack) {
                    return Center(
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
                    print('when data');
                    return _incomeList(context: context, data: data, ref: ref);
                  }, loading: () {
                    print('inside loading');
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }, error: (error, stack) {
                    return Center(
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
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('Gross Loss'), Text(data[0].grossLoss.toString())],
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
            children: [Text('Net Profit'), Text(data[0].netProfit.toString())],
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
        SizedBox(
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
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Gross Profit'),
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
            children: [Text('Net Loss'), Text(data[0].netLoss.toString())],
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
        SizedBox(
          width: 20,
        ),
        Text(balance.toString()),
      ],
    );
  }
}
