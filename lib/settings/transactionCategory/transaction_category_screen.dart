import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sentezel/common/ui/widget/floating_action_button_widget.dart';
import 'package:sentezel/common/ui/widget/top_bar_widget.dart';
import 'package:sentezel/settings/ledger_master/new_ledger_master_screen.dart';

class TransactionCategoryScreen extends StatelessWidget {
  const TransactionCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
