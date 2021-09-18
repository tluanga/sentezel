import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sentezel/common/ui/widget/floating_action_button_widget.dart';
import 'package:sentezel/common/ui/widget/top_bar_widget.dart';
import 'package:sentezel/settings/ledger_master/new_ledger_master_screen.dart';
import 'package:sentezel/settings/transactionCategory/transaction_category_list_controller.dart';

class TransactionCategoryScreen extends HookConsumerWidget {
  const TransactionCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TopBarWidget(
              title: 'Transaction Category',
              onClose: () {
                Navigator.pop(context);
              },
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: TextFormField(
                decoration: const InputDecoration(labelText: 'Search Ledger'),
                onChanged: (value) {
                  ref.watch(transactionCategoryListProvider.notifier).loadData(
                        searchParam: value,
                      );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SentezelFloatingActionButton(
        onPressed: () {
          showCupertinoModalBottomSheet(
            expand: true,
            context: context,
            backgroundColor: Colors.transparent,
            builder: (context) => const NewLedgerMasterScreen(),
          );
        },
      ),
    );
  }
}
