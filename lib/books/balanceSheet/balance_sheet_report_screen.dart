import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/books/balanceSheet/balance_sheet_controller.dart';
import 'package:sentezel/books/widgets/report_top_bar_widget.dart';

class BalanceSheetReportScreen extends HookConsumerWidget {
  const BalanceSheetReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(balanceSheetControllerProvider);
    useEffect(() {
      ref.watch(balanceSheetControllerProvider.notifier).loadData();
    }, []);
    return Material(
      child: SafeArea(
          child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  ReportTopBarWidget(
                      title: 'BalanceSheet',
                      onGenerateExcel: () {},
                      onGeneratePdf: () {},
                      onClose: () {}),
                  const TabBar(
                    tabs: [
                      Text(
                        'Liabilities',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      Text(
                        'Assets',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      )
                    ],
                  ),
                  Expanded(
                    child: TabBarView(children: [
                      // ------------Liabilities Side----------
                      state.when(data: (data) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                const Text('Creditors'),
                                Text(data[0].creditors.toString())
                              ],
                            ),
                            Row(
                              children: [
                                const Text('Capital'),
                                Text(data[0].capital.toString())
                              ],
                            ),
                            Row(
                              children: [
                                const Text('Add: Net Profit'),
                                Text(data[0].netProfit.toString())
                              ],
                            ),
                            Expanded(
                                child: ListView.builder(
                                    itemCount: data[0].asset.length,
                                    itemBuilder: (context, index) {
                                      return Row(
                                        children: [
                                          Text(data[0].asset[index].name),
                                          Text(data[0]
                                              .asset[index]
                                              .amount
                                              .toString())
                                        ],
                                      );
                                    }))
                          ],
                        );
                      }, loading: () {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }, error: (error, stack) {
                        throw (error.toString());
                      }),
                      // -----------Assets Side-------
                      state.when(data: (data) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                const Text('Cash in hand'),
                                Text(data[0].cash.toString())
                              ],
                            ),
                            Row(
                              children: [
                                const Text('Cash at Bank'),
                                Text(data[0].bank.toString())
                              ],
                            ),
                            Row(
                              children: [
                                const Text('Debtors'),
                                Text(data[0].debtors.toString())
                              ],
                            )
                          ],
                        );
                      }, loading: () {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }, error: (error, stack) {
                        throw (error.toString());
                      })
                    ]),
                  )
                ],
              ))),
    );
  }
}
