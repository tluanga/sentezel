import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/common/ui/widget/topBar_widget.dart';
import 'package:sentezel/newTransaction/debtRepayment/debtorList_controller.dart';

class DebtorListScreen extends HookConsumerWidget {
  const DebtorListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(debtorListControllerProvider);
    useEffect(() {
      ref.read(debtorListControllerProvider.notifier).getList();
    }, []);
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          TopBarWidget(
            onClose: () {
              Navigator.pop(context);
            },
            title: 'Debt Repayment',
          ),

          TextFormField(
            decoration: InputDecoration(
              labelText: 'Search Debtor',
            ),
          ),
          state.when(data: (data) {
            return Text('Data Available');
          }, loading: () {
            return Container(
              child: Text('Loading'),
            );
          }, error: (error, stack) {
            return Container(
              child: Text(error.toString()),
            );
          }),
          //---List the Debtor--
        ],
      ),
    ));
  }

  _list() {}
}
