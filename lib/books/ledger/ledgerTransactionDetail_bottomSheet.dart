import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/books/ledger/ledgerTransaction_model.dart';

class LedgerTransactionDetailBottomSheet extends HookConsumerWidget {
  final LedgerTransaction ledgerTransaction;
  const LedgerTransactionDetailBottomSheet({
    Key? key,
    required this.ledgerTransaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      child: Container(
        child: Column(
          children: [
            Text('Ledger Transaction'),
          ],
        ),
      ),
    );
  }
}
