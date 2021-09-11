import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/books/tradingAccount/tradingAccount_controller.dart';
import 'package:sentezel/books/widgets/reportTopBar_widget.dart';
import 'tradingAccount_model.dart';

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
        child: Container(
          child: Column(
            children: [
              ReportTopBarWidget(
                  title: 'Trading Account',
                  onGenerateExcel: () {},
                  onGeneratePdf: () {},
                  onClose: () {}),
              state.when(data: (data) {
                print('when data');
                return _list(context: context, data: data, ref: ref);
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
        ),
      ),
    );
  }

  _list(
      {required BuildContext context,
      required List<TradingAccount> data,
      required WidgetRef ref}) {
    return Expanded(
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _listItem(
            context: context,
            item: data[index],
            ref: ref,
          );
        },
      ),
    );
  }

  _listItem(
      {required BuildContext context,
      required TradingAccount item,
      required WidgetRef ref}) {
    int balance = 0;
    if (item.creditAmount > item.debitAmount) {
      balance = item.creditAmount - item.debitAmount;
    } else if (item.debitAmount > item.creditAmount) {
      balance = item.debitAmount - item.creditAmount;
    } else if (item.creditAmount == item.debitAmount) {
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
