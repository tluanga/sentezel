import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/books/ledger/ledger_model.dart';
import 'package:sentezel/books/widgets/periodSeletionBar_widget.dart';
import 'package:sentezel/common/ui/widget/topBar_widget.dart';

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
              TopBarWidget(
                  title: 'Ledger-${ledgerReport.name}',
                  onClose: () {
                    Navigator.pop(context);
                  }),
              PeriodSelectionBarWidget(),
            ],
          ),
        ),
      ),
    );
  }

  _list() {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                child: Text('Date'),
              ),
              Container(
                child: Text('Particular'),
              ),
              Container(
                child: Text('Amount'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
