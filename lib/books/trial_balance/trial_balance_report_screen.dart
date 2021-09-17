import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/books/trial_balance/trial_balance_controller.dart';
import 'package:sentezel/books/widgets/report_top_bar_widget.dart';
import 'trial_balance_model.dart';

class TrialBalanceReportScreen extends HookConsumerWidget {
  const TrialBalanceReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(trialBalanceControllerProvider);
    useEffect(() {
      ref.watch(trialBalanceControllerProvider.notifier).loadData();
    }, []);
    return Material(
      child: SafeArea(
          child: Column(
        children: [
          ReportTopBarWidget(
              title: 'Trial Balance',
              onGenerateExcel: () {},
              onGeneratePdf: () {},
              onClose: () {
                Navigator.pop(context);
              }),
          state.when(data: (data) {
            return _list(context: context, data: data, ref: ref);
          }, loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }, error: (error, stack) {
            throw error.toString();
          })
        ],
      )),
    );
  }

  _list(
      {required BuildContext context,
      required List<TrialBalance> data,
      required WidgetRef ref}) {
    return Expanded(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                  padding: const EdgeInsets.all(15),
                  color: Colors.cyan[50],
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: const Text('Particulars',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w500))),
              const VerticalDivider(
                width: 2,
              ),
              Container(
                  padding: const EdgeInsets.all(15),
                  color: Colors.cyan[50],
                  width: MediaQuery.of(context).size.width * 0.27,
                  child: const Text('Debit',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w500))),
              const VerticalDivider(
                width: 2,
              ),
              Container(
                  padding: const EdgeInsets.all(15),
                  color: Colors.cyan[50],
                  width: MediaQuery.of(context).size.width * 0.27,
                  child: const Text('Credit',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w500))),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return _listItem(context: context, item: data[index], ref: ref);
            },
          )),
        ],
      ),
    );
  }

  _listItem(
      {required BuildContext context,
      required TrialBalance item,
      required WidgetRef ref}) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                child: Text(
                  item.ledgerName.toString(),
                  textAlign: TextAlign.center,
                )),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.27,
                child: Text(
                  item.totalCredit > item.totalDebit
                      ? ''
                      : item.balance.toString(),
                  textAlign: TextAlign.center,
                )),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.27,
                child: Text(
                  item.totalCredit > item.totalDebit
                      ? item.balance.toString()
                      : '',
                  textAlign: TextAlign.center,
                )),
          ],
        ),
        const Divider()
      ],
    );
  }
}
