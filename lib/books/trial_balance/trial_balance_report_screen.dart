import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/books/trial_balance/trial_balance_controller.dart';
import 'package:sentezel/books/widgets/report_top_bar_widget.dart';
import 'trial_balance_excel.dart';
import 'trial_balance_model.dart';
import 'trial_balance_pdf.dart';

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
              onGenerateExcel: () {
                state.when(data: (data) {
                  return createTrialBLExl(data);
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
    int _finalDebitTotal = 0;
    int _finalCreditTotal = 0;

    for (var element in data) {
      if (element.totalCredit > element.totalDebit) {
        _finalCreditTotal += element.balance;
      } else if (element.totalCredit < element.totalDebit) {
        _finalDebitTotal += element.balance;
      }
    }

    return Expanded(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                  padding: const EdgeInsets.all(15),
                  color: Colors.cyan[50],
                  width: MediaQuery.of(context).size.width * 0.43,
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
          // const Spacer(),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                child: const Text(
                  'Total',
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.27,
                  child: Text(
                    _finalDebitTotal.toString(),
                    textAlign: TextAlign.center,
                  )),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.27,
                  child: Text(
                    _finalCreditTotal.toString(),
                    textAlign: TextAlign.center,
                  ))
            ],
          ),
          const SizedBox(
            height: 10,
          )
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
