import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
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
            Text(
              'Ledger Transaction Detail',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Text('Date'),
                ),
                Container(
                  child: Text(
                    DateFormat(
                      'dd MMMM yyyy hh:mm',
                    ).format(ledgerTransaction.transaction.date),
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Text('Amount'),
                ),
                Container(
                  child: Text(
                    ledgerTransaction.amount.toString(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
