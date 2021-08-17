import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/books/ledger/ledger_model.dart';
import 'package:sentezel/books/widgets/periodSeletionBar_widget.dart';

class LedgerDetailScreen extends HookConsumerWidget {
  final LedgerReport ledgerReport;
  const LedgerDetailScreen({Key? key, required this.ledgerReport})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      child: SafeArea(
        child: Container(
          child: Column(
            children: [
              PeriodSelectionBarWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
