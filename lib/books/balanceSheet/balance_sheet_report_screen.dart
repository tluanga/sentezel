import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/books/balanceSheet/balance_sheet_controller.dart';
import 'package:sentezel/books/widgets/report_top_bar_widget.dart';
import 'balance_sheet_excel.dart';
import 'balance_sheet_pdf.dart';

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
                      onGenerateExcel: () {
                        state.when(data: (data) {
                          return createBLAcExl(data);
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
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              data[0].creditors != 0
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Creditors'),
                                        Text(data[0].creditors.toString())
                                      ],
                                    )
                                  : Container(),
                              data[0].capital != 0
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Capital'),
                                        Text(data[0].capital.toString())
                                      ],
                                    )
                                  : Container(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Add: Net Profit'),
                                  Text(data[0].netProfit.toString())
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Less: Net Loss'),
                                  Text('- ${data[0].netLoss.toString()}')
                                ],
                              ),
                              const Spacer(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Total'),
                                  Text(data[0].totalLiabilities.toString())
                                ],
                              )
                            ],
                          ),
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
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              data[0].cash != 0
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Cash in hand'),
                                        Text(data[0].cash.toString())
                                      ],
                                    )
                                  : Container(),
                              data[0].bank != 0
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Cash at Bank'),
                                        Text(data[0].bank.toString())
                                      ],
                                    )
                                  : Container(),
                              data[0].debtors != 0
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Debtors'),
                                        Text(data[0].debtors.toString())
                                      ],
                                    )
                                  : Container(),
                              Expanded(
                                  child: ListView.builder(
                                      itemCount: data[0].asset.length,
                                      itemBuilder: (context, index) {
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(data[0].asset[index].name),
                                            Text(data[0]
                                                .asset[index]
                                                .amount
                                                .toString())
                                          ],
                                        );
                                      })),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Total'),
                                  Text(data[0].totalAssets.toString())
                                ],
                              )
                            ],
                          ),
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
