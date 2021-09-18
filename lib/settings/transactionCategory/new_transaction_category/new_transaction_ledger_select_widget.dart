import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sentezel/common/ui/widget/top_bar_for_bottom_sheet_widget.dart';
import 'package:sentezel/settings/transactionCategory/new_transaction_category/new_transaction_ledger_select_controller.dart';

class NewTransactionLedgerSelectWidget extends HookConsumerWidget {
  const NewTransactionLedgerSelectWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      ref
          .read(newTransactionLedgerSelectControllerProvider.notifier)
          .loadData();
    }, []);
    return Material(
      child: Column(
        children: [
          TopBarForBottomSheetWidget(
            label: 'Select Ledger',
            onExit: () {
              Navigator.pop(context);
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Select Ledger'),
          ),
          ref.read(newTransactionLedgerSelectControllerProvider).when(
              data: (data) {
            return const Text('data');
          }, loading: () {
            return CircularProgressIndicator();
          }, error: (error, stack) {
            return Text('Error');
          })
        ],
      ),
    );
  }
}
